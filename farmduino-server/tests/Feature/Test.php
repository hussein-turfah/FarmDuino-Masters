<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class LoginTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testLogin()
    {
        $data = [
            'email' => 'test@example.com',
            'password' => 'password',
        ];

        $response = $this->postJson('/api/v1.0.0/login', $data);

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'token',
                     'user' => [
                         'id',
                         'name',
                         'email',
                         // Add other expected properties here
                     ],
                 ]);
    }
}
