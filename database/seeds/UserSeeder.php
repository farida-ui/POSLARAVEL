<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Kasir',
            'email' => 'kasir@gmail.com',
            'email_verified_at' => now(),
            'password' => Hash::make('kasir'),
             'photo' => 'profil.png',
             'remember_token' => Str::random(10),
             'role' => 'kasir'
        ]);
    }
}
