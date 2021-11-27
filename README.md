# PFL-PROJECT

### CASOS DE TESTE, EXPLICAÇÃO SUCINTA DA FUNÇÃO E ESTRATÉGIAS UTILIZADAS
------------------------------------------------
### SOMA

#### Sinais
> **1. Soma de 2 BigNumbers Positivos** 
> 
>Resultado Positivo e é efetuada a soma ao respetivo valor absoluto do BigNumber 
>
> `somaBN (Positive[3])(Positive[2]) = Positive [5]`
>
> **2. Soma de 2 BigNumbers negativos** 
> 
>Resultado Negativo e é efetuada a soma ao respetivo valor absoluto do BigNumber 
>
>`somaBN (Negative[3])(Negative[2]) = Negative [5]`
>
>**3. Soma de 1 BigNumber Positivo com 1 BigNumber Negativo** 
>
> É efetuada a subtração do BigNumber Positivo pelo BigNumber Negativo, considerando ambos os BigNumbers Positivos
>
>`somaBN (Positive[3])(Negative[2]) = Positive [1]`
>
> **4. Soma de 1 BigNumber Negativo com 1 BigNumber Negativo**
>
> É efetuada a subtração do BigNumber Positivo pelo BigNumber Negativo, considerando ambos Positivos
>
>`somaBN (Negative[3])(Positive[2]) = Negative [1]`

#### Soma de números com quantidades diferentes de dígitos
> **5. Soma de número x com número y , onde x tem mais dígitos** 
> 
> Enchemos o número y com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
>    
> Subtração efetuada normalmente
> 
> **6. Soma de número x com número y , onde y tem mais dígitos**  
> 
> Enchemos o número x com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos.
> 
> Subtração efetuada normalmente
> 
> **7. Soma de números com número igual de dígitos**
> 

#### Resultado da soma tem número superior de dígitos a qualquer um dos números

------------------------------------------------
### 2 . SUBTRAÇÃO

##### 2.1 Sinais
> __1. Subtração de um BigNumber Positivo por um Negativo__  
> 
> Neste caso o sinal da operação é Positivo e é efetuada a soma dos valores absolutos dos BigNumbers
> 
> __2. Subtração de um BigNumber Positivo por um Negativo__  
> 
> Neste caso o sinal da operação é Negativo e é efetuada a soma dos valores absolutos dos BigNumbers
> 
> __3. Soma de 1 BigNumber Positivo com 1 dígito Negativo__ 
> 
> Quando o caso 2.2 não se aplica, procedimento 2.3 é aplicado 
> 
> __4. Soma de 2 BigNumber Negativos__ 
> 
> Quando o caso 2.2 não se aplica, procedimento 2.3 é aplicado 

##### 2.2 Quando o resultado da subtração é 0
> **1. Subtração de BigNumbers com sinal e valor absoluto iguais**  
> 
> Neste caso, não se segue para a função auxiliar para calcular normalmente a subtração e devolve- se simplesmente Positive [0].

##### 2.3 Quando o valore absoluto dos BigNumbers é Diferente



##### Diminuição das casas 

------------------------------------------------
#### 3. MULTIPLICAÇÃO
#### Sinais
> __1. Multiplicação de BigNumbers com o mesmo sinal__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber
> 
> __1. Multiplicação de BigNumbers com o mesmo sinal__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber

------------------------------------------------

### EXPLICAÇÃO SUNCINTA DE CADA FUNÇÃO


------------------------------------------------
### RESPOSTA A ALÍNEA 4

> Compare as resoluções das alíneas 1 e 3 com tipos (Int -> Int), (Integer ->
Integer) e (BigNumber -> BigNumber), comparando a sua aplicação a números grandes
e verificando qual o maior número que cada uma aceita como argumento.

------------------------------------------------
| Name             | E-Mail              |
| ---------------- |-------------------- |
| Sofia Germer     | up201907461@up.pt   |
| Miguel Lopes     | up201704590@up.pt   |
