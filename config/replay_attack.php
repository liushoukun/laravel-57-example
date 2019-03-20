<?php
// +----------------------------------------------------------------------
// | When work is a pleasure, life is a joy!
// +----------------------------------------------------------------------
// | User: shook Liu  |  Email:24147287@qq.com  | Time: 2019/3/20 11:08
// +----------------------------------------------------------------------
// | TITLE: todo?
// +----------------------------------------------------------------------


return [

    /**
     * A switch of replay attacks.
     * If false, it will not check any request is a replay attack or not.
     */
    'enabled' => env('REPLAY_ATTACK', true),
    /**
     * The expire time in seconds.
     */
    'expire' => 120,


    'timestamp_key' => env('REPLAY_ATTACK_TIMESTAMP_KEY', 'x-ca-timestamp'),
    'nonce_key' => env('REPLAY_ATTACK_NONCE_KEY', 'x-ca-nonce'),

];
