D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "lib"

  library "forwardable"
  library "yaml"

  configure_code_diagnostics(D::Ruby.strict)
end

