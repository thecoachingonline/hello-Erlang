-module(lattice_cryptography).

-export([encrypt/2, decrypt/2]).

-define(N, 4096).

encrypt(plaintext, key) ->
    {lwe_params, {n, m, q}} = ntru_encrypt:generate_params(?N),
    ciphertext = ntru_encrypt:encrypt(lwe_params, plaintext, key),
    ciphertext.

decrypt(ciphertext, key) ->
    {lwe_params, {n, m, q}} = ntru_encrypt:generate_params(?N),
    plaintext = ntru_encrypt:decrypt(lwe_params, ciphertext, key),
    plaintext.

plaintext = "สวัสดีชาวโลก".
key = "my_secret_key".

ciphertext = encrypt(plaintext, key).

plaintext2 = decrypt(ciphertext, key).

io:format("plaintext: ~s~n", [plaintext2]).