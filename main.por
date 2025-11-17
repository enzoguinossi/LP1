programa {
	inclua biblioteca Tipos
    //Nome,genero(0 = homem,1 = mulher),peso(kg),altura(cm)
    cadeia pacientes[10][4]
    inteiro ultimoIndicePaciente = -1,opcaoEscolhida, opcaoMenu = -1
    logico opcaoValida = verdadeiro
    funcao inicio() {
    	cadastrarPaciente()
        /*faca {
        limpa()
        mostrarMenu()
        escreva("Insira a opção desejada: ")
        escolha(opcaoMenu) {
        	caso 1:
        	cadastrarPaciente()
        	pare
        	caso 2:
        }

        } enquanto(nao opcaoValida)*/
    }

    funcao vazio mostrarMenu() {
        escreva("***********************************")
        escreva("*          Menu de Opções         *")
        escreva("***********************************")
        escreva("*                                 *")
        escreva("*  1 - Cadastrar Paciente         *")
        escreva("*  2 - Calcular IMC               *")
        escreva("*  3 - Exibir Peso Ideal          *")
        escreva("*  4 - Mostrar Estado Nutricional *")
        escreva("*  5 - Calcular Gasto Energético  *")
        escreva("*  6 - Sair                       *")
        escreva("*                                 *")
        escreva("***********************************")
    }
    
	funcao vazio cadastrarPaciente(){
		cadeia nome, inputUsuario, genero, peso, altura
		escreva("Digite o nome do paciente a ser cadastrado: \n")
		leia(nome)
		escreva("Insira o genêro do paciente: (0 para Homem, 1 para mulher): \n")
		leia(genero)
		escreva("Insira o peso do paciente: (kg) \n")
		leia(peso)
		escreva("Digite a altura do paciente: (cm) \n")
		leia(altura)

		pacientes[ultimoIndicePaciente + 1][0] = nome
		pacientes[ultimoIndicePaciente + 1][1] = genero
		pacientes[ultimoIndicePaciente + 1][2] = peso
		pacientes[ultimoIndicePaciente + 1][3] = altura
		ultimoIndicePaciente++
	}

   /* funcao vazio mostrarIMC() {
	
    }*/

	funcao real calcularIMC(inteiro indicePaciente){
		real peso = Tipos.cadeia_para_real(pacientes[indicePaciente][2])
		real altura = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
		real IMC = 0.0
		IMC = (peso/(altura^2))
	retorne IMC
	}

    funcao cadeia exibirPesoIdeal(inteiro indicePaciente) {

        cadeia nome = pacientes[indicePaciente][0]
        real pesoAtual = Tipos.cadeia_para_real(pacientes[indicePaciente][2])
        real pesoIdeal = calcularPesoIdeal(indicePaciente)

        real diferenca = pesoAtual - pesoIdeal
        cadeia msgFinal

        se (diferenca > 0) {
            msgFinal = ("Seu peso atual é " + Tipos.real_para_cadeia(pesoAtual) + " kg. Você deve emagrecer " + Tipos.real_para_cadeia(diferenca) + " kg para alcançar seu peso ideal")
        } senao se (diferenca < 0) {
            msgFinal = ("Seu peso atual é " + Tipos.real_para_cadeia(pesoAtual) + " kg. Você deve ganhar " + Tipos.real_para_cadeia(-diferenca) + " kg para alcançar seu peso ideal")
        } senao {
            msgFinal = ("Seu peso atual é " + Tipos.real_para_cadeia(pesoAtual) + " kg. Você já está no peso ideal!")
        }

        cadeia resultado = ("***********************************\n" + "Resultados — Peso Ideal\n" + "***********************************\n" + "paciente: " + nome + "\n" + "Peso Ideal: " + Tipos.real_para_cadeia(pesoIdeal) + " kg\n" + "***********************************\n" + msgFinal)
        retorne resultado
    }


    funcao real calcularPesoIdeal(inteiro indicePaciente) {
		real altura = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
		real peso = Tipos.cadeia_para_real(pacientes[indicePaciente][2])
		real pesoIdeal
		inteiro generoInteiro = Tipos.cadeia_para_inteiro(pacientes[indicePaciente][1],10)
		logico genero = Tipos.inteiro_para_logico(generoInteiro)
		se (nao genero) {
			pesoIdeal = ((0.75 * altura) - 62.5)
		} senao {
			pesoIdeal = ((0.675 * altura) - 56.25)
		}
	
		retorne pesoIdeal 
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3567; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */