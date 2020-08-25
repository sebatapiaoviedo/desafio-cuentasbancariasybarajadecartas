class Cuentabancaria
    attr_accessor :banco, :n_cuenta, :saldo
    def initialize (banco, n_cuenta, saldo = 0)
        @banco = banco
        @n_cuenta = n_cuenta
        @saldo = saldo
    end
    def transferir (monto, cuenta_externa)
        @saldo = @saldo - monto
        cuenta_externa.saldo = cuenta_externa.saldo + monto
    end
end
class Usuario
    attr_accessor :nombre
    def initialize (nombre, cuentas)
        @nombre = nombre
        @cuentas = cuentas
    end
    def saldo_total
        total = 0
        @cuentas.each do |cuenta|
        total += cuenta.saldo
        end
        total
    end
end
cuenta1 = Cuentabancaria.new("BCI", "12345", 5000)
cuenta2 = Cuentabancaria.new("BCH", "6789", 5000)
cuenta3 = Cuentabancaria.new("SANTANDER", "666", 7000)
cuenta4 = Cuentabancaria.new("ESTADO", "777", 7000)
usuario1 = Usuario.new("nombre", [cuenta3, cuenta4])
cuenta1.transferir(5000, cuenta2)
print cuenta1.inspect
print cuenta2.inspect
print usuario1.saldo_total