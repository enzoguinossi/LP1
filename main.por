programa {
	inclua biblioteca Tipos
	inclua biblioteca Util
    //nome,genero(0 = homem,1 = mulher),peso(kg),altura(cm)
    cadeia pacientes[10][4]
    inteiro ultimoIndicePaciente = -1,opcaoEscolhida, opcaoMenu = -1, indicePacienteEscolhido = -1
    logico executando = verdadeiro
    
    funcao inicio() {
        escreva("\n\n============ SISTEMA DE AVALIAÇÃO FÍSICA 2000 ============\n\n")
        Util.aguarde(1000)

        faca {
    	opcaoMenu = mostrarMenuPrincipal()
        limpa()
        escolha(opcaoMenu) {
            caso 1:
                cadastrarPaciente()
            pare 
            caso 2:
            	 indicePacienteEscolhido = escolherPaciente()
                mostrarIMC(indicePacienteEscolhido)
            pare
            caso 3:
        		 indicePacienteEscolhido = escolherPaciente()
                exibirPesoIdeal(indicePacienteEscolhido)
            pare
            caso 4:
            pare
            caso 5:
            pare
            caso 6:
            pare
            caso contrario:
					escreva("\n\nOpção inválida! Tente novamente.\n\n")
					Util.aguarde(1000)
				pare
        }

        } enquanto(executando)
    }

    funcao inteiro escolherPaciente() {
        cadeia inputUsuario = ""
        inteiro idPaciente = -1
        logico inputValido = verdadeiro
        faca {
        escreva("Insira o ID do paciente a ser consultado: \n")
        leia(inputUsuario)
        se (Tipos.cadeia_e_inteiro(inputUsuario,10))
        {
            idPaciente = Tipos.cadeia_para_inteiro(inputUsuario,10)
            se(idPaciente<=Util.numero_linhas(pacientes) e idPaciente >= 0) {
                inputValido = verdadeiro
            }
        } senao {
            inputValido = falso 
            escreva("\nA entrada do usuário foi de tipo inválido. Tente novamente.\n\n")
            Util.aguarde(1000)
        }
        } enquanto(nao inputValido)
        retorne idPaciente
    }
    
    funcao inteiro mostrarMenuPrincipal() {
        cadeia inputOpcao
	    inteiro opcao = -1
	    logico valido = falso
        faca {
            escreva("+---------------------------------+\n")
            escreva("|   Sistema de avaliação física   |\n")
            escreva("+---------------------------------+\n")
            escreva("|                                 |\n")
            escreva("|  1 - Cadastrar Paciente         |\n")
            escreva("|  2 - Calcular IMC               |\n")
            escreva("|  3 - Exibir Peso Ideal          |\n")
            escreva("|  4 - Mostrar Estado Nutricional |\n")
            escreva("|  5 - Calcular Gasto Energético  |\n")
            escreva("|  6 - Sair                       |\n")
            escreva("|                                 |\n")
            escreva("+---------------------------------+\n")

            leia(inputOpcao)
	
	        se (Tipos.cadeia_e_inteiro(inputOpcao, 10))
	        {
	            opcao = Tipos.cadeia_para_inteiro(inputOpcao, 10)
	            valido = verdadeiro
	        }
	        senao
	        {
	            escreva("\nValor inválido! Tente novamente.\n")
	            Util.aguarde(1000)
	            valido = falso
	        }
        } enquanto(nao valido)
        retorne opcao
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

    funcao vazio mostrarIMC(inteiro indicePaciente) {
	
    }

	funcao real calcularIMC(inteiro indicePaciente){
		real peso = 0.0
		peso = Tipos.cadeia_para_real(pacientes[indicePaciente][2])
		real altura = 0.0
		altura = Tipos.cadeia_para_real(pacientes[indicePaciente][3])
		real IMC = 0.0
		IMC = (peso / (altura * altura))
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
 * @POSICAO-CURSOR = 2743; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */