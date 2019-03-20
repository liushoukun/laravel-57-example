<?php

namespace App\Http\Middleware;

use Closure;

/**
 * Class Domain
 * @package App\Http\Middleware
 */
class Domain
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $request->rootDomain = $this->rootDomain($request);
        $request->subDomain = $this->subDomain($request);

        return $next($request);
    }


    /**
     * @param \Illuminate\Http\Request $request
     * @return string
     */
    public function rootDomain($request)
    {
        $host = $request->getHttpHost();
        $item = explode('.', $host);
        $count = count($item);
        $domain = $count > 1 ? $item[$count - 2] . '.' . $item[$count - 1] : $item[0];
        return $domain;
    }

    /**
     * @param \Illuminate\Http\Request $request
     * @return string
     */
    public function subDomain($request)
    {
        $host = $request->getHttpHost();
        $subDomainArray = explode('.', $host, -2);
        $subDomain = implode('.', $subDomainArray);
        return $subDomain;
    }
}
