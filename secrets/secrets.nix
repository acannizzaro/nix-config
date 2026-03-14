let
  # Public keys for agenix encryption
  recovery = "age1lpqyxpqrppau02t9rl3f6rh5ar7w3a2wwnwrftyv7vjed6qjudfqryl2cx";
  acannizzaro = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINJpg4z09PYNHg3nyO1cOG5DNLmkhp3ZqIwk6kZGbqnq";
  personal-mbp = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBGg6PfRyqK97CQ9IVn0nmVpOwadkigHSKQ1ml3KkNeT";
in
{
  "github-token.age".publicKeys = [ recovery acannizzaro personal-mbp ];
  "env-secrets.age".publicKeys = [ recovery acannizzaro personal-mbp ];
}
