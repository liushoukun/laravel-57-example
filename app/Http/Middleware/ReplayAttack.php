<?php
// +----------------------------------------------------------------------
// | When work is a pleasure, life is a joy!
// +----------------------------------------------------------------------
// | User: shook Liu  |  Email:24147287@qq.com  | Time: 2019/3/20 11:05
// +----------------------------------------------------------------------
// | TITLE: todo?
// +----------------------------------------------------------------------

namespace App\Http\Middleware;

use Closure;
use App\Exceptions\ReplayAttackException;
use Illuminate\Contracts\Cache\Repository as Cache;
use Illuminate\Contracts\Config\Repository as Config;


class ReplayAttack
{
    /**
     * @var \Illuminate\Contracts\Cache\Repository
     */
    private $cache;

    /**
     * @var bool
     */
    private $enabled;

    /**
     * Expire time interval in seconds.
     * @var int
     */
    private $expire;

    /**
     * timestamp headers key
     * @var string
     */
    protected $timestampKey;
    /**
     * nonce headers key
     * @var string
     */
    protected $nonceKey;

    public function __construct(Config $config, Cache $cache)
    {
        $this->enabled = $config->get('replay_attack.enabled');
        $this->expire = (int)$config->get('replay_attack.expire');
        $this->timestampKey = $config->get('replay_attack.timestamp_key', 'x-ca-timestamp');
        $this->nonceKey = $config->get('replay_attack.nonce_key', 'x-ca-nonce');
        $this->cache = $cache;
    }

    /**
     * @var \Illuminate\Http\Request
     */
    private $request;

    public function handle($request, Closure $next)
    {
        $this->request = $request;
        if (!$this->enabled) {
            return $next($request);
        }

        if (!$this->checkTimestamp()) {
            throw new ReplayAttackException();
        }
        if (!$this->checkNonce()) {
            throw new ReplayAttackException();
        }

        return $next($request);
    }

    protected function checkTimestamp(): bool
    {
        if (!$this->request->header('x-ca-timestamp')) {
            return false;
        }
        $timestamp = $this->request->header('x-ca-timestamp');
        return $this->isExpired($timestamp);
    }

    protected function checkNonce(): bool
    {
        if (!$this->request->header('x-ca-nonce')) {
            return false;
        }
        $nonce = $this->request->header('x-ca-nonce');
        $key = 'api:nonce:' . $nonce;
        if ($this->cache->has($key)) {
            return false;
        }
        $this->cache->put($key, time(), $this->expire / 60);

        return true;
    }

    private function isExpired($timestamp): bool
    {
        return abs(time() - (int)$timestamp) <= $this->expire;
    }
}
