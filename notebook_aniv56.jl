### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 12244d34-2085-4b99-a19d-dcda64901d3c
using Pkg,OrdinaryDiffEq, AbstractAlgebra, Polynomials, LinearAlgebra, PlutoUI, Latexify

# ╔═╡ fcd228c9-eb32-4fd9-8fb9-f2df1d79a7dc
using Plots

# ╔═╡ b6be95c2-d187-433a-82a1-089410ef5580
html"""
<div style="
position: absolute;
width: calc(100% - 30px);
border: 50vw solid #282936;
border-top: 500px solid #282936;
border-bottom: none;
box-sizing: content-box;
left: calc(-50vw + 15px);
top: -500px;
height: 800px;
pointer-events: none;
"></div>

<div style="
height: 800px;
width: 100%;
background: #282936;
color: #fff;
padding-top: 68px;
">
<span style="
font-family: Vollkorn, serif;
font-weight: 700;
font-feature-settings: 'lnum', 'pnum';
"> 
<button onclick='present()' style='background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;'>Iniciar Presentación</button>
<br>
<br>
<br>
<p style="
font-size: 1.5rem;
opacity: .8;
"><em>JORNADAS ACADÉMICAS</em></p>
<p style="
font-size: 1.5rem;
opacity: .8;
"><em>56 ANIVERSARIO DE LA CARRERA DE MATEMÁTICA</em></p>

<p style="text-align: center; font-size: 2rem;">
<em> Problemas inversos de autovalores para matrices Jacobi periódicas y generalizadas a partir de sus datos espectrales extremales </em>
</p>

<p style="
font-size: 1.5rem;
text-align: center;
opacity: .8;
"><em>Charlie Lozano</em></p>
<div style="display: flex; justify-content: center;">
<div  notthestyle="position: relative; right: 0; top: 0; z-index: 300;">

</div>
</div>
</div>

<style>
body {
overflow-x: hidden;
}
</style>"""

# ╔═╡ 3feaf757-ff48-44a2-a215-575fe612674d
begin
	struct TwoColumn{L, R}
	    left::L
	    right::R
	end
	
	function Base.show(io, mime::MIME"text/html", tc::TwoColumn)
	    write(io, """<div style="display: flex;"><div style="flex: 50%;">""")
	    show(io, mime, tc.left)
	    write(io, """</div><div style="flex: 50%;">""")
	    show(io, mime, tc.right)
	    write(io, """</div></div>""")
	end
end

# ╔═╡ 74595914-a089-4984-961f-a9d19614675d
md"""
##
"""

# ╔═╡ 493fcf66-26af-4fca-b613-2591750e5d30
html"""<div><img src="https://i.imgur.com/w0TKAZn.png" style="width: 100%";></div>"""

# ╔═╡ 82387b99-2558-4dc7-b6a2-064a0f74b3f0
theme(:default)

# ╔═╡ f042b24f-b3cc-4f4f-9c5b-f5675250e663
# PlutoUI.TableOfContents(aside=true)

# ╔═╡ 36aa8b1a-eb08-4b51-90a6-90d579b7bfad
html"""
<style>
  pluto-helpbox {
    display: none;
  }
</style>
"""

# ╔═╡ 629d548d-619c-4df3-985c-96fe273d907e
#using QRCode

# ╔═╡ 6a31fe1a-d92d-4477-a622-bcd2855d0b0b
#qrcode = Qrcode("https://github.com/")

# ╔═╡ 8006b746-85bb-4c25-ba6e-812b62e35b4a
# using PlotlyBase

# ╔═╡ d9dce1b0-b534-4740-ae36-20be872c8ca0
import OrdinaryDiffEq.solve as de_solve

# ╔═╡ 20d889df-2165-48df-8a74-4a511c9206e2
# import Plotly.plot as pplot

# ╔═╡ 250bbc56-c12c-4994-a89a-04ed3f1964d2
# import Plotly.scatter as pscatter

# ╔═╡ 0672057b-e46b-46e9-a910-6847b94e5732
# Pkg.resolve()

# ╔═╡ 19aa0519-e543-4899-9ccc-0c0469ace8be
plotly()

# ╔═╡ 34b145ef-248a-4746-8082-ac0623440c32
md"""
##
"""

# ╔═╡ 3cd870c7-1567-411c-84a9-6abd58d8fe20
md"""
## DJ en apuros
"""

# ╔═╡ a77069c6-f158-431c-9e52-4c3f20572111
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/324296539.sd.mp4?s=806775db4de3140951b439ef4b2a69c8bd91fa0f&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/406192053.sd.mp4?s=47d7e32a5c532eb2738b6c7d8bee64541fe3a1ec&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ 53f67ce4-4aac-486c-a4f5-24a5b7b9a654
md"""
## Angustia animalista e ingeniería genética
"""

# ╔═╡ 833b9be3-4e7b-4e9c-925c-9b24eba44a18
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/371565368.sd.mp4?s=0169f88ecfa55d0e38ebbfcc4b30043803ed57dc&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/435803053.sd.mp4?s=25671d0afd271e2fe1d8b7259411c34a75d733e0&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ 39f76355-2ea9-4038-a15d-b8e498441e9e
md"""
## Robots con flow
"""

# ╔═╡ 360df6ad-6e55-4652-9046-ef9b55dd6f53
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/567008718.sd.mp4?s=d02e034479bac6989864704fdbf9ba999c0a4602&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/566971860.sd.mp4?s=521f0aebe677f79c66374856b47861d19c40037d&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ 334ca72b-f0f8-41a8-ae78-81abeddaaaf9
md"""
## Energías alternativas
"""

# ╔═╡ 348120b7-467c-4501-8504-42a1e889c917
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/499416622.sd.mp4?s=5670097689fb90e726393c1905ba4ab42a8a32ed&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/585487011.sd.mp4?s=b8922d606f8f40495702ef3ce41873abcf3140e2&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ fb2b68d8-975b-4b38-8351-60b93db138f7
md"""
## Hipertensión arterial
"""

# ╔═╡ 608a7cf8-01ea-4296-8d35-cb00e820e0a7
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/411678407.sd.mp4?s=4f23072c92b4280123206e791881f923a7652ccf&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/533789634.sd.mp4?s=ad0298eec89643a4afe56a2ad77811d2c34bf021&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ 19a7a9e7-7c4a-441e-b0e5-ffd19f6cfd8e
md"""
# Matrices

> #### _"Almost every combination of the adjectives proper, latent, characteristic, eigen and secular, with the nouns root, number and value, has been used in the literature for what we call a proper valor."_ Finite-Dimensional Vector Spaces, Halmos (1974)

> #### _"Vibrations are everywhere, and so too are the eigenvalue associated with them."_ Parlett (1998)


"""






# ╔═╡ f9a30155-c524-4449-8d7e-9dda99d399db
md"""
##
"""

# ╔═╡ 3e242dd6-2dd5-4931-b3fa-a897fd3c0878
TwoColumn(md""" 

#### Autovalores/Autovectores
Dada una matriz

$$A=\left(\begin{matrix}A_{11}&A_{12}&\cdots&A_{1n}\\A_{21}&A_{22}&\cdots&A_{2n}\\\vdots&\vdots&\ddots&\vdots\\A_{n1}&A_{n2}&\cdots&A_{nn}\end{matrix}\right)$$


Un número ``λ`` es un **auto-valor** de ``A`` si

> - Existe vector no nulo ``x`` tal que ``Ax=λx`` se denominan **auto-vectores** (del auto-valor ``λ``)
> - La matriz ``A-λI`` no es inversible
> - ``λ`` es una raíz del polinomio ``p(λ)=\det(A-λI)`` 
""",
md"""
#### Polinomio característico
> - ``p(λ)=\det(A-λI)`` se denomina **polinomio característico** de ``A``
> - Los auto-vectores ``x`` del auto-valor ``λ,`` junto al vector nulo forman un subespacio vectorial  ``\mathcal{N}_{\lambda}=\ker(A-λI)`` y se denomina **auto-espacio** del auto-valor ``λ`` y el par ``(\lambda,x)`` **auto-par** (eigen-par)

Geométricamente 

""")

# ╔═╡ 588a23a5-1d2c-4a32-b3d8-779f89793a5a
md"""
##
"""

# ╔═╡ 13b2fc98-2173-4638-9ada-0aeef70d795d
html"""
<iframe width="560" height="315" src="https://www.youtube.com/embed/Gx0PaWI9eYo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
"""

# ╔═╡ 6f4f7f73-abea-4507-bdd6-16c37ad1e818
AbstractAlgebra.charpoly(A::Matrix) = charpoly(QQ["x"][1], matrix(QQ,A))

# ╔═╡ 3ee15f64-66fe-4570-8e14-40cd93f7d384
md"""
## Ejemplo
"""

# ╔═╡ 641d76ce-0bc4-4561-bbd8-20c81cb5bca5
let

range = -10:1:10
md"""
	
Esta es una matriz "escuudible": ¡haga clic en el número y arrastre para cambiar!
	
**``A =``**  
	
``(``	
 $(@bind a1 Scrubbable( range; default=1.0))
 $(@bind b1 Scrubbable( range; default=0.0))
 $(@bind c1 Scrubbable( range; default=0.0))
``)``

``(``
$(@bind d1 Scrubbable(range; default=0.0 ))
$(@bind e1 Scrubbable(range; default=1.0)) 
$(@bind f1 Scrubbable(range; default=0.0))
``)``  

``(``
$(@bind g1 Scrubbable(range; default=0.0 ))
$(@bind h1 Scrubbable(range; default=0.0)) 
$(@bind i1 Scrubbable(range; default=1.0))
``)`` 
	

	
"""
end

# ╔═╡ eed3568d-e647-485f-ab68-9619c408e961
AA=[a1 b1 c1; d1 e1 f1;g1 h1 i1];

# ╔═╡ a9fdfaa5-d9e3-43f0-8eb1-e0a20f4b0b0f
latexify(repr(charpoly(AA)))

# ╔═╡ 58ee5733-e606-4a7c-9c70-4279529ff6f8
begin	
	eigA=ComplexF64.(eigen(AA).values);
	reigA = [Real(eigA[i]) for i in 1:length(eigA) if is_real(eigA[i])==true];
	reigApoints = [(Real(eigA[i]),0) for i in 1:length(eigA) if is_real(eigA[i])==true];
	plot(scatter(eigA,label=false),begin plot((minimum(reigA)-1):0.1:(maximum(reigA)+1),x->det(x* diagm(0=>ones(3))-AA),lw=3,label=" Polinomio característico"); scatter!(reigApoints,label=" Autovalores reales") end)
end

# ╔═╡ 2e47bf97-fd05-4973-8ccc-16c97f307b01
md"""
## Ejemplo (matriz aleatoria)
"""

# ╔═╡ 1231cb19-33e8-4833-a510-3be047331618
md"""
Consideremos una matriz de tamaño $(@bind m Scrubbable(1:10; default=5))
"""

# ╔═╡ 0804509e-a23d-411a-ac6a-6ba9c386fdfc
md"""
## Ejemplo (matriz aleatoria simétrica)
"""

# ╔═╡ f9a93182-3cc7-4d9c-9a77-1e7e6200e92c
md"""
Consideremos una matriz simétrica de tamaño $(@bind m1 Scrubbable(1:10; default=5))
"""

# ╔═╡ 8506a440-0e9c-4927-9258-8e33f8d43658
begin
	R=rand(-10:10,m,m);
	auxmat=rand(-10:10,m1,m1)
	S=auxmat+auxmat'
	eigR=ComplexF64.(eigen(R).values);
	eigS=ComplexF64.(eigen(S).values);
end;

# ╔═╡ be92e2d6-a6e2-42a9-a306-610177dd3d04
latexify(R)

# ╔═╡ d331554d-36af-4b32-bec5-52325d1e1107
latexify(repr(charpoly(R)))

# ╔═╡ 1912670e-7afc-4c52-a5d2-4266ee6ad32f
begin
	reigR = [Real(eigR[i]) for i in 1:length(eigR) if is_real(eigR[i])==true];
	reigRpoints = [(Real(eigR[i]),0) for i in 1:length(eigR) if is_real(eigR[i])==true];
	plot(scatter(eigR,label=false),begin plot(minimum(reigR)-1:0.1:maximum(reigR)+1,x->det(x* diagm(0=>ones(m))-R),lw=3,label=" Polinomio característico"); scatter!(reigRpoints,label=" Autovalores reales") end)
end

# ╔═╡ 4d109fcc-1294-4015-b6d1-063164ee492b
latexify(S)

# ╔═╡ 9dcd54bd-beda-479b-893c-74fbaeeb20bb
latexify(repr(charpoly(R)))

# ╔═╡ 257bada4-8250-4603-97f2-c07c307caf9b
begin
	reigS = [Real(eigS[i]) for i in 1:length(eigS) if is_real(eigS[i])==true];
	reigSpoints = [(Real(eigS[i]),0) for i in 1:length(eigS) if is_real(eigS[i])==true];
	plot(scatter(eigS,label=false),begin plot(minimum(reigS)-1:0.1:maximum(reigS)+1,x->det(x* diagm(0=>ones(m1))-S),lw=3,label=" Polinomio característico"); scatter!(reigSpoints,label=" Autovalores reales") end)
end

# ╔═╡ 2736d5f3-4285-4bef-beaf-c6d318fa9ab6
begin
	slidera=md"``a=``$(@bind a Slider(-0.5:.01:0.5,show_value=true))";
	sliderb=md"``b=``$(@bind b Slider(-2:.25:2,show_value=true))";
end;

# ╔═╡ 3c6ce0fa-3050-452f-a3b1-a4d82a0966f1
md"""
## Un problema mecánico

Supongamos que tenemos un sistema mecánico simple que consiste en una masa $m$ unida a un resorte con constante $k$ y amortiguamiento $c.$

La dinámica del sistema se puede modelar mediante una ecuación diferencial de segundo orden de la forma:

> $m\ x''+c\ x'+k\ x=f(t)$

donde $x$ es la posición de la masa, $f(t)$ es la fuerza aplicada al sistema y las constantes $m$, $c$ y $k$ son la masa, el amortiguamiento y la constante del resorte, respectivamente.

Para determinar los polos del sistema, se puede escribir la ecuación diferencial en forma de espacio de estados. Definimos los estados del sistema como $x_1 = x$ y $x_2 = x'$, donde $x'$ es la velocidad de la masa. Entonces, podemos escribir la ecuación diferencial como:

> ``\begin{pmatrix}x_1'\\x_2'\end{pmatrix}=\begin{pmatrix}0&1\\-\frac{k}{m}&-\frac{c}{m}\end{pmatrix}\begin{pmatrix}x_1\\x_2\end{pmatrix}+\begin{pmatrix}0\\\frac{1}{m}\end{pmatrix}f(t)``

"""

# ╔═╡ 7e4d8e07-ddbf-454d-b9cd-f7f130477f84
md"""
## Un problema biológico

El sistema inmunitario es un sistema dinámico complejo que responde a la presencia de patógenos, como bacterias o virus, para proteger al organismo. El modelo de respuesta inmunitaria se puede describir mediante un sistema de ecuaciones diferenciales que relacionan la cantidad de células inmunitarias, como los linfocitos `T` y `B,` con la cantidad de patógenos presentes en el organismo.

Supongamos que tenemos un modelo simple de respuesta inmunitaria que consta de dos ecuaciones diferenciales de primer orden:

> $\frac{dT}{dt}=k_1P-αT$
> $\frac{dP}{dt}=-k_2PT$

donde $T$ es la cantidad de linfocitos presentes en el organismo, $P$ es la cantidad de patógenos presentes y $k_1$, $k_2$, y $\alpha$ son constantes que determinan la tasa de producción de linfocitos, la tasa de eliminación de patógenos y la tasa de muerte de los linfocitos, respectivamente.

"""

# ╔═╡ e333fd27-1499-4505-8276-12648fb0357c
md"""
## Asignación de polos
"""

# ╔═╡ 661a8f6d-b204-477b-bda0-3a1cc3db3cac
md"""
> Se refiere a la tarea de **diseñar un controlador para un sistema dinámico lineal** que permita asignar los polos del sistema a ubicaciones deseadas en el plano complejo. **Los polos (autovalores) representan la dinámica del sistema**. La ubicación de los polos determina la estabilidad, la respuesta transitoria y la capacidad de seguimiento del sistema."""

# ╔═╡ 12cbbf33-822a-40a4-abb3-248e0031d39c
TwoColumn(md"""
##### Problemas
> - Las ubicaciones de los polos están determinadas por los requisitos de rendimiento, como la velocidad de respuesta, la amortiguación y el error estacionario 
> - No todas las ubicaciones de polos son alcanzables, es posible que no se pueda asignar los polos a ubicaciones deseadas
> - La asignación de polos puede no ser única, pueden haber varios controladores que satisfagan los mismos requisitos de rendimiento.
""",md"""
##### Técnicas
> - Método de colocación de polos
> - Método de retroalimentación de estados
> - Diseño basado en observador.""")



# ╔═╡ e6c2fa3f-ba9c-4da8-b82a-6245f23fe3c2
md"""
## El modelo matemático general
"""

# ╔═╡ fb8dd12d-553b-41e0-9299-309a85f7cc5e
TwoColumn(md""" 
> ###### El problema de control
> $ẋ(t) = Ax(t) + Bu(t)$
> ``x(t)`` es el **vector de estado**, $u(t)$ es el **vector de entrada**

> ###### Retroalimentación de estado
> $u(t) = -Kx(t) + r(t)$
> ``K`` es la matriz de **retroalimentación de estado**, que se debe diseñar, $r(t)$ es la **señal de referencia deseada**""",md"""
Sustituyendo la retroalimentación de estado en la ecuación diferencial de estado, se obtiene:

> ###### Problema de asignación de polos
> $ẋ(t) = (A - BK)x(t) + Br(t)$

El objetivo es diseñar $K$ de tal manera que los polos del sistema, que son **las raíces del polinomio característico del sistema**, se ubiquen en posiciones deseadas en el plano complejo.
""")

# ╔═╡ e4427075-3f3a-4771-b3a0-14c20f7accb2
md"""
## El Sistema Lineal
"""

# ╔═╡ 0f0779e8-4c07-455b-a761-fc41693c25c0
TwoColumn(md"""
Consideremos el sistema lineal
> ``\dot{x}(t)=A x(t)``
donde ``x (t) ∈\mathbb{R}^n `` es el *estado*.

""",let

range1 = -1:0.02:1
md"""	
**``A =``**  
	
``(``	
 $(@bind aa Scrubbable( range1; default=-0.04))
 $(@bind bb Scrubbable( range1; default=-1))
 $(@bind cc Scrubbable( range1; default=0))
``)``

``(``
$(@bind dd Scrubbable(range1; default=1 ))
$(@bind ee Scrubbable(range1; default=-0.5)) 
$(@bind ff Scrubbable(range1; default=0))
``)``  

``(``
$(@bind gg Scrubbable(range1; default=0 ))
$(@bind hh Scrubbable(range1; default=0)) 
$(@bind ii Scrubbable(range1; default=-0.2))
``)`` 


Esta es una matriz "escuudible": ¡haga clic en el número y arrastre para cambiar!	

	
"""
end)

# ╔═╡ 5474d87c-3454-4192-8086-6acfd050f760
begin
	A=[aa bb cc
		dd ee ff
		gg hh ii]; 
	B=[-0.5 0 0
		0 0 0
		0 0 0];
	F=[-.2*b 1 0
		-1 2*b 0
		0 0 1];	
end;

# ╔═╡ bee7cfd7-c50b-48fe-ae3b-857fd42a9716
begin
	f(u,p,t) = A*u
	u0 = [0.8,0.8,0.8]
	u1 = [1,1,1]
	u2 = [1.2,1.2,1.2]
	tspan = (0.0,30.0)
	prob0 = ODEProblem(f,u0,tspan)
	prob1 = ODEProblem(f,u1,tspan)
	prob2 = ODEProblem(f,u2,tspan)
	sol0=de_solve(prob0,Tsit5(), reltol=1e-8)
	sol1=de_solve(prob1,Tsit5(), reltol=1e-8)
	sol2=de_solve(prob2,Tsit5(), reltol=1e-8)
	x0,y0,z0=sol0[1,:],sol0[2,:],sol0[3,:]
	x1,y1,z1=sol1[1,:],sol1[2,:],sol1[3,:]
	x2,y2,z2=sol2[1,:],sol2[2,:],sol2[3,:]
end;

# ╔═╡ 40966a45-c3f0-4769-85aa-65dcadd5c3e6
begin
	ttspan=(0.0,10)
	g(u,p,t)=(A+B*F)*u
	prob3 = ODEProblem(g,u0,ttspan)
	sol3=de_solve(prob3,Tsit5(), reltol=1e-8)
	x3,y3,z3=sol3[1,:],sol3[2,:],sol3[3,:]
end;

# ╔═╡ 3ca3df7f-472b-4485-b470-db206f6bfe36
begin
	p1=begin
		plot(x0,y0,z0)
		plot!(x1,y1,z1)
		plot!(x2,y2,z2)
		#plot!(x3,y3,z3)
	end
	p2=begin
		plot(x0,y0)
		plot!(x1,y1)
		plot!(x2,y2)
	end
	p3=begin
		plot(x0,z0)
		plot!(x1,z1)
		plot!(x2,z2)
	end
	p4=begin
		plot(y0,z0)
		plot!(y1,z1)
		plot!(y2,z2)
	end
	
	plot(p1, p2, p3, p4, layout = (2, 2), legend = false,lw=2)
end

# ╔═╡ 7503724c-113b-4e71-9af5-86ebf408c3b1
md"""
## Algunos tipos de controles
Si ``u(t)=Fx(t)`` (*retroalimentación de estado*), entonces: 
> $\dot{x}(t)=(A +BF )x(t)$
> **Objetivo:** Elegir la matri ``F`` para lograr *estabilidad* y *acelerar* la respuesta. El problema se puede traducir en la elección de ``F`` para **reasignar valores propios** de la matriz ``A + BF``.

Si el estado ``x(t)`` no es directamente observable, sino solamente una salida ``y(t)``, relacionada con ``x (t)`` via ``y(t)=Cx(t)`` y el control ``u (t)`` ahora debe elegirse como ``u (t) = Ky (t)``, entonces:
>``\dot{x}(t)=(A +BKC )x(t)``
> **Objetivo:** Seleccionar la matriz de salida ``K`` para reasignar los valores propios de ``A + BKC``.
"""

# ╔═╡ 85a9fe4b-d346-43e0-8045-290f9d6b7c8c
md"""
##
"""

# ╔═╡ 1a0c33fa-5f04-4f33-915f-5e0c5ada42d7
md"$A=$",latexify(A),md"$B=$",latexify(B),md"$F=$", latexify(F)

# ╔═╡ 71a887d7-1605-4288-a1bb-067482feea4f
sliderb

# ╔═╡ d1b77dff-1605-426f-89fc-32bd4e29c185
begin
	p5=begin
	plot(x0,y0,z0,label=false)
	plot!(x3,y3,z3,label=false)
	end;

	plot(p5,plot([x0,x3],label=false),plot([y0,y3],label=false),plot([z0,z3],label=false),layout=(2,2),lw=2)
	
end

# ╔═╡ cfb24ec2-bd73-4c3a-833e-b1cc386adc41
slider0=md"``σ=``$(@bind σ Slider(0.2:0.01:1.8,show_value=true))";

# ╔═╡ b1251b44-297c-497e-8586-1d2b59996454
md"""
# Problema Inverso de Autovalores
"""

# ╔═╡ b7a0caf0-468b-4e33-89ec-601fbdd76529
md"""
## 
"""

# ╔═╡ 5bfe7a82-965c-4edc-8808-99e29d05605e
TwoColumn(md"""
> ###### Problemas directos
> Analizar y derivar la información espectral e inferir el comportamiento dinámico de un sistema a partir de parámetros (físicos) conocidos a priori (como masa, longitud, elasticidad, inductancia, capacitancia, etc.)

> ###### Problemas inversos
> Validar, determinar o estimar los parámetros del sistema de acuerdo con su comportamiento observado o esperado.

""",md"""
##### Problema inverso de autovalores (IEP) 

> En el contexto de matrices, un **problema inverso de autovalores (IEP)** se refiere a la **reconstrucción de una matriz a partir de datos espectrales** prescritos.

> Problemas fundamentales:
> - *Solubilidad*
> - *Computabilidad*
> - *Sensibilidad*
> - *Aplicabilidad*

""")

# ╔═╡ 61ed6eb1-df65-446d-9674-9a7a50b73138
md"""
## Algunas aplicaciones
> *diseño de control, identificación de sistemas, tomografía sísmica, análisis de componentes principales, exploración y detección remota, procesamiento de conjuntos de antenas, geofísica, espectroscopía molecular, física de partículas, análisis estructural, teoría de circuitos y simulación de sistemas mecánicos.* 

"""

# ╔═╡ fcafa82b-cfeb-4257-92f1-455375b79532
html"""
<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/521491380.sd.mp4?s=be703a8900a87be1d1e095c4befe0fc6d14f4eeb&profile_id=165&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/392289251.sd.mp4?s=0b80dc8802ce4e423dc5cfac641b046e2eac208b&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="https://player.vimeo.com/external/372334720.sd.mp4?s=3b94e2d48b5844adcda82889e4809589de5d9172&profile_id=164&oauth2_token_id=57447761"></div>

<div style="position:; top: 0; right: 0;"><img src="
https://player.vimeo.com/external/530526774.sd.mp4?s=30c764f4df73afe47e971d23951d9f23a1ff3b94&profile_id=164&oauth2_token_id=57447761"></div>

"""

# ╔═╡ 0b29d326-59a8-4d6c-b585-3915bd5c000f
md"""
	## Mecánica Aplicada
	Considera la vibración de cuentas en una cuerda tensa, cada una con masa ``m_i``, que se colocan a lo largo de la cuerda con el mismo espaciado horizontal ``h`` y están sujetas a una fuerza de tensión constante horizontal ``F``. La ecuación del movimiento para cuatro cuentas es 
	```math
	m_1\frac{d^2x_1}{dt^2}=-F\frac{x_1}{h}+F\frac{x_2-x_1}{h}
	```
	```math
	m_2\frac{d^2x_2}{dt^2}=-F\frac{x_2-x_1}{h}+F\frac{x_3-x_2}{h}
	```
	```math
	m_3\frac{d^2x_3}{dt^2}=-F\frac{x_3-x_2}{h}+F\frac{x_4-x_3}{h}
	```
	```math
	m_4\frac{d^2x_4}{dt^2}=-F\frac{x_4-x_3}{h}-F\frac{x_4}{h}
	```
		
	"""

# ╔═╡ f6d8ab21-ea83-426d-8d8e-6f438d9c0130
slider0

# ╔═╡ 601fa98f-81df-4fb8-985b-2635431fd035
begin
	points=[(0,0),(2,0),(3,σ*randn()),(4,σ*randn()),(5,σ*randn()),(6,σ*randn()),(7,σ*randn()),(8,σ*randn()),(9,σ*randn()),(10,0),(12,0)];
	plot(points,ylims=(-5,5),lw=3,axis=false,grid=false,label=false,size=(600,100))
	scatter!(points,label=false)
end

# ╔═╡ a79b831d-6443-489b-ace3-2db1584084f8
md"""
##

En general y matricialmente
> $\frac{d^2x}{dt^2}=-DJ_0x,$
donde ``x=(x_1 x_2 \dots x_n)'`` y $J_0$ es la matriz de Jacobi 



```math 
J_0=\left( \begin{matrix}2&-1&0&&&\\-1&2&-1&&&\\0&-1&2&\cdots&&0\\\vdots&&&\ddots&&\\0&&&&2&-1\\0&&&&-1&2\end{matrix}
\right)
``` y ``D`` es una matriz diagonal ``D =\text{diag}(d_1, d_2,..., d_n)``, con ``d_i=\frac{F}{m_ih}.``
Los valores propios del producto matricial ``DJ_0`` son precisamente los cuadrados de las llamadas **frecuencias naturales** del sistema.

Un problema inverso relacionado consiste en colocar los pesos ``m_i, i = 1, ..., n``  apropiadamente de modo que el sistema resultante tenga un conjunto prescrito de frecuencias naturales.
"""

# ╔═╡ 3bf84ea2-6ff6-47af-9c64-3dcbe786250a
md"""
# Problemas inversos de autovalores extremales
### Para matrices de Jacobi periódicas
"""

# ╔═╡ e1679284-5cee-46d0-806f-d749cb07c9bf
md"""
##
"""

# ╔═╡ 9283bbb4-82c3-425d-acdf-d220f5f1a136
TwoColumn(md"""
#### Matrices de Jacobi periódicas

> `` J_n=\begin{pmatrix} a_{1} & b_{1} &  &   &  b_{n} \\ b_{1} & a_{2} & b_{2} &  &  \\ & b_{2} & a_{3} & \ddots &  \\  & \ddots & \ddots & \ddots &  \\  &  & \ddots & \ddots & b_{n-1} \\ b_{n} &  &  & b_{n-1} & a_{n} \end{pmatrix}``

``a_j,b_j\in\mathbb{R}`` y $b_j> 0,\,j=1,2,\ldots,n.$  


""",md"""
#### Matrices de Jacobi periódicas generalizadas

> ``\mathcal{J}_n=\begin{pmatrix} a_{1} & b_{1} &  &   &  c_{n} \\ c_{1} & a_{2} & b_{2} &  &  \\ & c_{2} & a_{3} & \ddots &  \\  & \ddots & \ddots & \ddots &  \\  &  & \ddots & \ddots & b_{n-1} \\ b_{n} &  &  & c_{n-1} & a_{n} \end{pmatrix}``
``a_j, b_j, c_j\in\mathbb{R}`` y $b_jc_j>0,\,j=1,2,\ldots,n.$ 
""")

# ╔═╡ e6348de0-fd5a-48cc-9bce-8b7a334eba52
md"""
###### Las entradas en las esquinas inferior izquierda y superior derecha aparecen para que sea periódica. Si $b_n=0,\, J_n$ es una matriz tridiagonal simétrica también llamada matriz de Jacobi.
"""

# ╔═╡ f1bef616-9b29-4c89-890a-22d890120fb4
md"""
## Submatrices Principales 
"""

# ╔═╡ b6e88a4d-01a8-4f92-a7be-41f05bd84fc4
TwoColumn(md"""

Son las submatrices

$$A_1=\left(\begin{matrix}A_{11}\end{matrix}\right),$$

$$A_2=\left(\begin{matrix}A_{11}&A_{12}\\A_{21}&A_{22}\end{matrix}\right),$$

$$A_3=\left(\begin{matrix}A_{11}&A_{12}&A_{13}\\A_{21}&A_{22}&A_{23}\\A_{31}&A_{32}&A_{33}\end{matrix}\right),$$
$$\vdots$$
$$A_j=\left(\begin{matrix}A_{11}&A_{12}&\cdots&A_{1j}\\A_{21}&A_{22}&\cdots&A_{2j}\\\vdots&\vdots&\ddots&\vdots\\A_{j1}&A_{j2}&\cdots&A_{jj}\end{matrix}\right),$$
para $j=1,\ldots,n.$
""",
	md"""
- ``\sigma(A_j)=\left\{\lambda_{1}^{(j)},\lambda_{2}^{(j)},\ldots,\lambda_{j}^{(j)} \right\}$ es el espectro de $A_j`` 
- ``P_j(\lambda)`` es el polinomio característico de $A_j$
- ``\lambda_{1}^{(j)}`` y $\lambda_{j}^{(j)}$ es el valor propio más pequeño y más grande de $A_j$

- ``I_j`` la matriz identidad de $j\times j$
Consideramos también, para $j=2,\ldots,n-1,$ la matriz

$$
\tilde{A}_{j}=\left(\begin{matrix}A_{22}&A_{23}&\cdots&A_{2j}\\A_{32}&A_{33}&\cdots&A_{3j}\\\vdots&\vdots&\ddots&\vdots\\A_{j2}&A_{j3}&\cdots&A_{jj}\end{matrix}\right),$$

que se obtiene eliminando la primera fila y columna de la matriz $A_j$ y cuyo polinomio característico es 
	
$$Q_{j}(\lambda)=\det(\lambda I_{j-1}-\tilde{A}_{j})$$ 
""")

# ╔═╡ 0f9f299b-0e9c-4f87-92d4-a02e99a3a806
md"""
## Propiedad de entrelazamiento de Cauchy
"""

# ╔═╡ 72dbaaf0-3934-4fe4-9f75-eb49e872c18c
md"""
> ###### Entrelazamiento
> Si los polinomios $f(x)$ y $g(x)$ tienen todos raices reales $r_1 ≤r_2 ≤···≤r_n$ y $s_1 ≤s_2 ≤···≤s_{n−1},$ respectivamente, entonces decimos que $f$ y $g$ se *entrelazan* si y solo si
> - ``\qquad r_1 ≤s_1 ≤r_2 ≤s_2≤\cdots≤s_{n−1} ≤r_n.``
"""

# ╔═╡ 4540ac70-b24c-4273-92c3-31dec4eceb91
md"""
> ###### Propiedad de entrelazamiento de Cauchy
> Si $A$ es una matriz hermitiana, y $B$ es una submatriz principal de $A,$ entonces los valores propios de $B$ entrelazan los valores propios de $A.$

"""

# ╔═╡ d7b5fee0-46c5-4e40-86e9-d77fc430d76d
md"""
> ###### Lema 1
> Sea $P(\lambda)$ un polinomio monico de grado $n$ con todos sus ceros reales. Si $\lambda_1$ y $\lambda_n$ son, respectivamente, el cero más pequeño y el más grande de $P(\lambda)$, entonces
> - ``\qquad \mu<\lambda_1``, implica $(-1)^{n}P(\mu)>0$,
> - ``\qquad \mu>\lambda_n``, implica $P(\mu)>0$
"""

# ╔═╡ 9fff376b-19a5-4e00-9360-165f6e295b9a
md"""
## Entrelazamiento en matrices de Jacobi periódicas

Por esta propiedad, los auto-valores mínimo y máximo, $λ_1^{(j)}$ y $λ_j^{(j)}$ , respectivamente, de cada submatriz principal principal $J_j, j = 1, 2, . . ., n,$ de la matriz $J_n$ satisfacen las relaciones:
> - ``\qquad λ_1^{(n)} ≤\cdots\leq λ_1^{(2)}≤λ_1^{(1)}≤λ_2^{(2)}≤\cdots≤λ_n^{(n)}``
> - ``\qquad λ_1^{(j)}≤a_i≤λ_j^{(j)},\quad i = 1,...,j\quad j = 1,...,n``
"""

# ╔═╡ ce2009ae-10e8-4fc4-9d67-a1bfb34178f6
function slice(a)
	ei=eigen(S).values
	mmmin=minimum(ei)-1
	mmmax=maximum(ei)+1
	plt=plot()
	for i in 1:a
		M=S[1:i,1:i]
		l=size(M)[1]
		plot!(mmmin:0.1:mmmax,x->det(x*diagm(0=>ones(l))-M))
	end
	return plt
end

# ╔═╡ d259c9c9-f7e8-44bd-906f-70c10a1f2b8a
slice(size(S)[1])

# ╔═╡ b29f9455-d4db-448d-ae9f-21da09ec1a1d
md"""
## La técnica

> ##### Lema 2
> Sea $J_n$ una matriz Jacobi periódica de $n\times n$ y $J_{j}$ la submatriz principal principal de $j\times j$ de $J_n$ con el polinomio característico ``P_{j}\left( \lambda \right) =\det\left( \lambda I_{j}-A_{j}\right),\,j=1,2,\ldots ,n`` Entonces la secuencia $\left\{P_{j}\left(\lambda \right)\right\}_{j=1}^{n}$ satisface la relación de recurrencia:
> - ``P_{1}(\lambda) = \lambda-a_{1},``
> - ``P_{j}(\lambda) = \left(\lambda-a_j\right) P_{j-1}(\lambda) - b_{j-1}^{2}P_{j-2}(\lambda) ,\quad j=2,3,\ldots,n-1,``
> - ``P_{n}(\lambda) = \left(\lambda-a_n\right) P_{n-1}(\lambda)- b_{n-1}^{2}P_{n-2}(\lambda) - 2\prod\limits_{i=1}^{n}b_{i}-b_{n}^{2}Q_{n-1}\left(\lambda\right),`` 
> con $P_{0}(\lambda)=1$.
"""

# ╔═╡ 4aed9cab-6b08-46ee-90f0-2efacb7d8756
md"""
## La demostración (un esbozo)

En primer lugar, para $j=2,\ldots,n-1,$ el siguiente sistema de ecuaciones lineales es consistente 

> ``P_{j}\left( \lambda_{1}^{(j)}\right) = \left( \lambda_{1}^{(j)}-a_{j}\right)P_{j-1}\left( \lambda_{1}^{(j)}\right)-b_{j-1}^2P_{j-2}\left( \lambda_{1}^{(j)}\right) = 0``
> ``P_{j}\left( \lambda_{j}^{(j)}\right) = \left( \lambda_{j}^{(j)}-a_{j}\right)P_{j-1}\left( \lambda_{j}^{(j)}\right)-b_{j-1}^2P_{j-2}\left( \lambda_{j}^{(j)}\right) = 0,``

pues, por el Lema 1, el determinante

> ``P_{j-1}\left( \lambda_{1}^{(j)}\right)P_{j-2}\left( \lambda_{j}^{(j)}\right)- P_{j-1}\left( \lambda_{j}^{(j)}\right)P_{j-2}\left( \lambda_{j}^{(j)}\right)``

es no nulo. Con esto reconstruimos inductivamente hasta la submatriz principal $J_{n-1}.$ De hecho

> ### ``a_1 = \lambda_{1}^{(1)}``

> ### ``a_j =\frac{\lambda_{1}^{(j)}P_{j-1}\left( \lambda_{1}^{(j)}\right)P_{j-2}\left( \lambda_{j}^{(j)}\right)-\lambda_{j}^{(j)}P_{j-1}\left( \lambda_{j}^{(j)}\right)P_{j-2}\left( \lambda_{1}^{(j)}\right)}{h_j}``
> ### ``b_{j-1}^{2} = \frac{\left(\lambda_{j}^{(j)}-\lambda_{1}^{(j)} \right)P_{j-1}\left( \lambda_{1}^{(j)}\right)P_{j-1}\left( \lambda_{j}^{(j)}\right)}{h_j},\,j=2,\ldots,n-1.``

Además, nuevamente por el Lema 1, tenemos que 
> ``b_{j-1}^2=\frac{(-1)^{j-1}P_{j-1}\left( \lambda_{1}^{(j)}\right)P_{j-1}\left( \lambda_{j}^{(j)}\right)}{(-1)^{j-1}h_j}>0,\quad j=2,\ldots,n-1,``
es positivo.

---

Para determinar $a_n, b_{n-1}, b_n$ debemos considerar el sistema

> ``P_{n}\left(\lambda_{1}^{(n)}\right) = \left(\lambda_{1}^{(n)}-a_n\right) P_{n-1}\left(\lambda_{1}^{(n)}\right) - b_{n-1}^{2}P_{n-2}\left(\lambda_{1}^{(n)}\right)``   
> ``\qquad\qquad\qquad\qquad\qquad\qquad-2\left(\prod\limits_{i=1}^{n-2} b_{i}\right)b_{n-1}b_n-b_n^{2}Q_{n-1}(\lambda_{1}^{(n)}) = 0,``
> ``P_{n}\left(\lambda_{n}^{(n)}\right) = \left(\lambda_{n}^{(n)}-a_n\right) P_{n-1}\left(\lambda_{n}^{(n)}\right) - b_{n-1}^{2}P_{n-2}\left(\lambda_{n}^{(n)}\right)``
> ``\qquad\qquad\qquad\qquad\qquad\qquad- 2\left(\prod\limits_{i=1}^{n-2}b_{i}\right) b_{n-1}b_n-b_n^{2}Q_{n-1}(\lambda_{n}^{(n)}) = 0,`` 

que podemos reescribir como

> ``P_{n-2}\left(\lambda_{1}^{(n)}\right)b_{n-1}^{2}+2\left(\prod\limits_{i=1}^{n-2}b_{i}\right)b_{n-1}b_n+Q_{n-1}\left(\lambda_{1}^{(n)}\right)b_n^{2}\\``
> ``\qquad\qquad\qquad\qquad\qquad\qquad\qquad=\lambda_{1}^{(n)}P_{n-1}\left(\lambda_{1}^{(n)}\right)-a_n P_{n-1}\left(\lambda_{1}^{(n)}\right),\\`` 
> ``P_{n-2}\left(\lambda_{n}^{(n)}\right)b_{n-1}^{2}+2\left(\prod\limits_{i=1}^{n-2}b_{i}\right)b_{n-1}b_n+Q_{n-1}\left(\lambda_{n}^{(n)}\right)b_n^{2}\\``
> ``\qquad\qquad\qquad\qquad\qquad\qquad\qquad=\lambda_{n}^{(n)}P_{n-1}\left(\lambda_{n}^{(n)}\right)-a_n P_{n-1}\left(\lambda_{n}^{(n)}\right).\\``

Manipulando apropiadamente el sistema es equivalente al siguiente

> ### $$R_n b_{n-1}^2+2cS_n b_{n-1}b_n+U_nb_n^2+T_n=0$$

donde 

> ``R_{j} = P_{j-1}\left(\lambda_{j}^{(j)}\right)P_{j-2}\left(\lambda_{1}^{(j)}\right) - P_{j-2}\left(\lambda_{j}^{(j)}\right)P_{j-1}\left(\lambda_{1}^{(j)}\right)``

> ``S_{n} =P_{n-1}\left(\lambda_{n}^{(n)}\right)- P_{n-1}\left(\lambda_{1}^{(n)}\right)``

> ``T_{j} = \left(\lambda_{j}^{(j)}-\lambda_{1}^{(j)} \right)P_{j-1}\left(\lambda_{1}^{(j)}\right)P_{j-1}\left( \lambda_{j}^{(j)}\right)``

> ``U_{n} = Q_{n-1}\left(\lambda_{1}^{(n)}\right)P_{n-1}\left(\lambda_{n}^{(n)}\right) - Q_{n-1}\left(\lambda_{n}^{(n)}\right)P_{n-1}\left(\lambda_{1}^{(n)}\right)``

> ``V_{n} =P_{n-2}\left(\lambda_{n}^{(n)}\right)- P_{n-2}\left(\lambda_{1}^{(n)}\right)``

> ``W_{n} = Q_{n-1}\left(\lambda_{1}^{(n)}\right)P_{n-2}\left(\lambda_{n}^{(n)}\right) - Q_{n-1}\left(\lambda_{n}^{(n)}\right)P_{n-2}\left(\lambda_{1}^{(n)}\right)``

> ``Z_{j} = \lambda_{j}^{(j)}P_{j-1}\left(\lambda_{j}^{(j)}\right)P_{j-2}\left(\lambda_{1}^{(j)}\right) - \lambda_{1}^{(j)} P_{j-2}\left(\lambda_{j}^{(j)}\right)P_{j-1}\left(\lambda_{1}^{(j)}\right)``

> ``\beta_j =\prod_{i=1}^{j}b_i,\, \text{for all}\, j=2,\ldots,n-1.``

---

Esto significa que el punto $(X,Y)=(b_{n-1},b_{n})$ debe pertenecer al conjunto

> #### $\mathcal{C}=\{(X,Y)\in\mathbb{R}^2_+: R_n X^2+2cS_n XY+U_nY^2+T_n=0\}.$

El conjunto $\mathcal{C}$ está contenido en una conica que puede o no ser degenerada. Sin embargo, la cónica siempre existe, es decir, no está vacía. De hecho, reescribiendo

> $\mathbf{L}M\mathbf{L}^T=0.$ 

donde 

> $\mathbf{L}=\begin{pmatrix}X & Y & 1\end{pmatrix},\quad  M=\begin{pmatrix} N & 0 \\ 0^T & T_n\end{pmatrix}, \quad\text{y}\quad N=\begin{pmatrix}R_n & cS_n\\ cS_n&U_n\end{pmatrix}.$

Notemos que la conica es degenerada si $\det{M}=0$, y no existe, si $\det{N}>0$ y $(R_n+U_n)\det{M}>0.$ 

Sin embargo, del Lema 1 obtenemos

> $-(R_n+U_n)T_n>0.$  

En consecuencia, de las hipótesis, tenemos $\det N>0$, luego 
> $(R_n+U_n)\det M=(R_n+U_n)T_n\det N<0,$ 
lo que implica que la cónica siempre existe. 

En realidad, $\mathcal{C}$ es parte de una elipse con centro en el origen. Por lo tanto, hay números positivos $b_n$ y $b_{n-1}$ que satisfacen la ecuación.
"""

# ╔═╡ a58574cf-fddd-485f-b22d-e38afece289a
md"""
## Problemas
> **Problema 1.** Dado el conjunto ordenado de $2n-1$ números reales; $$\lambda_{1}^{(n)}<\cdots<\lambda_{1}^{(j)}<\cdots<\lambda_{1}^{(2)}<\lambda_{1}^{(1)}<\lambda_{2}^{(2)}<\cdots<\lambda_{j}^{(j)}<\cdots<\lambda_{n}^{(n)},$$ y un número real positivo $d$, construir una matriz periódica de Jacobi $J_n$ de tal forma que $\lambda_{1}^{(j)}$ y $\lambda_{j}^{(j)}$ son el valor propio más pequeño y más grande, respectivamente, de $J_j,\,j=1,2,\ldots,n$ y $b_n=d$.


> **Problema 2.** Dado el conjunto ordenado de $2n-1$ números reales; $$\lambda_{1}^{(n)}<\cdots<\lambda_{1}^{(j)}<\cdots<\lambda_{1}^{(2)}<\lambda_{1}^{(1)}<\lambda_{2}^{(2)}<\cdots<\lambda_{j}^{(j)}<\cdots<\lambda_{n}^{(n)},$$ un vector $\mathbf{x}=(x_1,x_2,\ldots,x_n)^T$ with $x_i\neq0,\,i=1,2,\ldots,n$ y dos números reales positivos $d_{1}$ y $d_{2}$, construir una matriz Jacobi periódica generalizada $\mathcal{J}_n$ de tal forma que $\lambda_{1}^{(j)}$, and $\lambda_{j}^{(j)}$ son el valor propio más pequeño y más grande, respectivamente, de $\mathcal{J}_j,\,j=1,2,\ldots,n$, $\left(\lambda_{n}^{(n)},\mathbf{x}\right)$ es un eigenpar $\mathcal{J}_n$, $b_n=d_1$, y $c_n=d_2$.

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AbstractAlgebra = "c3fe647b-3220-5bb0-a1ea-a7954cac585d"
Latexify = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
OrdinaryDiffEq = "1dea7af3-3e70-54e6-95c3-0bf5283fa5ed"
Pkg = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Polynomials = "f27b6e38-b328-58d1-80ce-0feddd5e7a45"

[compat]
AbstractAlgebra = "~0.28.3"
Latexify = "~0.15.18"
OrdinaryDiffEq = "~6.49.4"
Plots = "~1.38.8"
PlutoUI = "~0.7.50"
Polynomials = "~3.2.8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "cf687de88b88ba44a9ef5146a223d66382b157a4"

[[deps.AbstractAlgebra]]
deps = ["GroupsCore", "InteractiveUtils", "LinearAlgebra", "MacroTools", "Markdown", "Random", "RandomExtensions", "SparseArrays", "Test"]
git-tree-sha1 = "46b8c80b17421a5ad54cc48740f83ff45705a040"
uuid = "c3fe647b-3220-5bb0-a1ea-a7954cac585d"
version = "0.28.3"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "cc37d689f599e8df4f464b2fa3870ff7db7492ef"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.6.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[deps.ArrayInterface]]
deps = ["Adapt", "LinearAlgebra", "Requires", "SnoopPrecompile", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "d76e35eb01ce7264ab8ee18ca9ba3fb4c844b6df"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "7.4.1"

[[deps.ArrayInterfaceCore]]
deps = ["LinearAlgebra", "SnoopPrecompile", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e5f08b5689b1aad068e01751889f2f615c7db36d"
uuid = "30b0a656-2188-435a-8636-2ec0e6a096e2"
version = "0.1.29"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitTwiddlingConvenienceFunctions]]
deps = ["Static"]
git-tree-sha1 = "0c5f81f47bbbcf4aea7b2959135713459170798b"
uuid = "62783981-4cbd-42fc-bca8-16325de8dc4b"
version = "0.1.5"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CPUSummary]]
deps = ["CpuId", "IfElse", "Static"]
git-tree-sha1 = "2c144ddb46b552f72d7eafe7cc2f50746e41ea21"
uuid = "2a0fbf3d-bb9c-48f3-b0a9-814d99fd7ab9"
version = "0.2.2"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "485193efd2176b88e6622a39a246f8c5b600e74e"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.6"

[[deps.CloseOpenIntervals]]
deps = ["Static", "StaticArrayInterface"]
git-tree-sha1 = "70232f82ffaab9dc52585e0dd043b5e0c6b714f1"
uuid = "fb6a15b2-703c-40df-9091-08a04967cfa9"
version = "0.1.12"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Random", "SnoopPrecompile"]
git-tree-sha1 = "aa3edc8f8dea6cbfa176ee12f7c2fc82f0608ed3"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.20.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.CommonSolve]]
git-tree-sha1 = "9441451ee712d1aec22edad62db1a9af3dc8d852"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.3"

[[deps.CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "89a9db8d28102b094992472d333674bd1a83ce2a"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.1"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.CpuId]]
deps = ["Markdown"]
git-tree-sha1 = "fcbb72b032692610bfbdb15018ac16a36cf2e406"
uuid = "adafc99b-e345-5852-983c-f28acb93d879"
version = "0.3.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.DiffEqBase]]
deps = ["ArrayInterface", "ChainRulesCore", "DataStructures", "Distributions", "DocStringExtensions", "EnumX", "FastBroadcast", "ForwardDiff", "FunctionWrappers", "FunctionWrappersWrappers", "LinearAlgebra", "Logging", "Markdown", "MuladdMacro", "Parameters", "PreallocationTools", "Printf", "RecursiveArrayTools", "Reexport", "Requires", "SciMLBase", "Setfield", "SparseArrays", "Static", "StaticArraysCore", "Statistics", "Tricks", "TruncatedStacktraces", "ZygoteRules"]
git-tree-sha1 = "15a24aa2414fad34136724c4a16e556f264ddd11"
uuid = "2b5f629d-d688-5b77-993f-72d75c75574e"
version = "6.122.1"

[[deps.DiffResults]]
deps = ["StaticArraysCore"]
git-tree-sha1 = "782dd5f4561f5d267313f23853baaaa4c52ea621"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.1.0"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "a4ad7ef19d2cdc2eff57abbbe68032b1cd0bd8f8"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.13.0"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "49eba9ad9f7ead780bfb7ee319f962c811c6d3b2"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.8"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "da9e1a9058f8d3eec3a8c9fe4faacfb89180066b"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.86"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[deps.EnumX]]
git-tree-sha1 = "bdb1942cd4c45e3c678fd11569d5cccd80976237"
uuid = "4e289a0a-7415-4d19-859d-a7e5c4648b56"
version = "1.0.4"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.ExponentialUtilities]]
deps = ["Adapt", "ArrayInterface", "GPUArraysCore", "GenericSchur", "LinearAlgebra", "Printf", "SnoopPrecompile", "SparseArrays", "libblastrampoline_jll"]
git-tree-sha1 = "fb7dbef7d2631e2d02c49e2750f7447648b0ec9b"
uuid = "d4d017d3-3776-5f7e-afef-a10c40355c18"
version = "1.24.0"

[[deps.ExprTools]]
git-tree-sha1 = "c1d06d129da9f55715c6c212866f5b1bddc5fa00"
uuid = "e2ba6199-217a-4e67-a87a-7c52f15ade04"
version = "0.1.9"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FastBroadcast]]
deps = ["ArrayInterface", "LinearAlgebra", "Polyester", "Static", "StaticArrayInterface", "StrideArraysCore"]
git-tree-sha1 = "d1248fceea0b26493fd33e8e9e8c553270da03bd"
uuid = "7034ab61-46d4-4ed7-9d0f-46aef9175898"
version = "0.2.5"

[[deps.FastClosures]]
git-tree-sha1 = "acebe244d53ee1b461970f8910c235b259e772ef"
uuid = "9aa1b823-49e4-5ca5-8b0f-3971ec8bab6a"
version = "0.3.2"

[[deps.FastLapackInterface]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c1293a93193f0ae94be7cf338d33e162c39d8788"
uuid = "29a986be-02c6-4525-aec4-84b980013641"
version = "1.2.9"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "0ba171480d51567ba337e5eea4e68a8231b7a2c3"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.13.10"

[[deps.FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Requires", "Setfield", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "03fcb1c42ec905d15b305359603888ec3e65f886"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.19.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "00e252f4d706b3d55a8863432e742bf5717b498d"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.35"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.FunctionWrappers]]
git-tree-sha1 = "d62485945ce5ae9c0c48f124a84998d755bae00e"
uuid = "069b7b12-0de2-55c6-9aab-29f3d0a68a2e"
version = "1.1.3"

[[deps.FunctionWrappersWrappers]]
deps = ["FunctionWrappers"]
git-tree-sha1 = "b104d487b34566608f8b4e1c39fb0b10aa279ff8"
uuid = "77dc65aa-8811-40c2-897b-53d922fa7daf"
version = "0.1.3"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GPUArraysCore]]
deps = ["Adapt"]
git-tree-sha1 = "1cd7f0af1aa58abc02ea1d872953a97359cb87fa"
uuid = "46192b85-c4d5-4398-a991-12ede77f4527"
version = "0.1.4"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "UUIDs", "p7zip_jll"]
git-tree-sha1 = "4423d87dc2d3201f3f1768a29e807ddc8cc867ef"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.71.8"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "3657eb348d44575cc5560c80d7e55b812ff6ffe1"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.71.8+0"

[[deps.GenericSchur]]
deps = ["LinearAlgebra", "Printf"]
git-tree-sha1 = "fb69b2a645fa69ba5f474af09221b9308b160ce6"
uuid = "c145ed77-6b09-5dd9-b285-bf645a82121e"
version = "0.5.3"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "d3b3624125c1474292d0d8ed0f65554ac37ddb23"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "1cf1d7dcb4bc32d7b4a5add4232db3750c27ecb4"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.8.0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.GroupsCore]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "9e1a5e9f3b81ad6a5c613d181664a0efc6fe6dd7"
uuid = "d5909c97-4eac-4ecc-a3dc-fdd0858a4120"
version = "0.4.0"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.HostCPUFeatures]]
deps = ["BitTwiddlingConvenienceFunctions", "IfElse", "Libdl", "Static"]
git-tree-sha1 = "734fd90dd2f920a2f1921d5388dcebe805b262dc"
uuid = "3e5b6fbb-0976-4d2c-9146-d79de83f2fb0"
version = "0.1.14"

[[deps.HypergeometricFunctions]]
deps = ["DualNumbers", "LinearAlgebra", "OpenLibm_jll", "SpecialFunctions", "Test"]
git-tree-sha1 = "709d864e3ed6e3545230601f94e11ebc65994641"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.11"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.IterativeSolvers]]
deps = ["LinearAlgebra", "Printf", "Random", "RecipesBase", "SparseArrays"]
git-tree-sha1 = "1169632f425f79429f245113b775a0e3d121457c"
uuid = "42fd0dbc-a981-5370-80f2-aaf504508153"
version = "0.9.2"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "f377670cda23b6b7c1c0b3893e37451c5c1a2185"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.5"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.KLU]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse_jll"]
git-tree-sha1 = "764164ed65c30738750965d55652db9c94c59bfe"
uuid = "ef3ab10e-7fda-4108-b977-705223b18434"
version = "0.4.0"

[[deps.Krylov]]
deps = ["LinearAlgebra", "Printf", "SparseArrays"]
git-tree-sha1 = "dd90aacbfb622f898a97c2a4411ac49101ebab8a"
uuid = "ba0b0d4f-ebba-5204-a429-3ac8c609bfb7"
version = "0.9.0"

[[deps.KrylovKit]]
deps = ["ChainRulesCore", "GPUArraysCore", "LinearAlgebra", "Printf"]
git-tree-sha1 = "1a5e1d9941c783b0119897d29f2eb665d876ecf3"
uuid = "0b1a1467-8014-51b9-945f-bf0ae24f4b77"
version = "0.6.0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "2422f47b34d4b127720a18f86fa7b1aa2e141f29"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.18"

[[deps.LayoutPointers]]
deps = ["ArrayInterface", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface"]
git-tree-sha1 = "88b8f66b604da079a627b6fb2860d3704a6729a1"
uuid = "10f19ff3-798f-405d-979b-55457f8fc047"
version = "0.1.14"

[[deps.Lazy]]
deps = ["MacroTools"]
git-tree-sha1 = "1370f8202dac30758f3c345f9909b97f53d87d3f"
uuid = "50d2b5c4-7a5e-59d5-8109-a42b560f39c0"
version = "0.15.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c7cb1f5d892775ba13767a87c7ada0b980ea0a71"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+2"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LineSearches]]
deps = ["LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "Printf"]
git-tree-sha1 = "7bbea35cec17305fc70a0e5b4641477dc0789d9d"
uuid = "d3d80556-e9d4-5f37-9878-2ab0fcc64255"
version = "7.2.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LinearSolve]]
deps = ["ArrayInterface", "DocStringExtensions", "EnumX", "FastLapackInterface", "GPUArraysCore", "IterativeSolvers", "KLU", "Krylov", "KrylovKit", "LinearAlgebra", "Preferences", "RecursiveFactorization", "Reexport", "SciMLBase", "SciMLOperators", "Setfield", "SnoopPrecompile", "SparseArrays", "Sparspak", "SuiteSparse", "UnPack"]
git-tree-sha1 = "62f966529c72c4677c2e65e35c0627e08c90f0e1"
uuid = "7ed4a6bd-45f5-4d41-b270-4a48e9bafcae"
version = "1.41.0"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoopVectorization]]
deps = ["ArrayInterface", "ArrayInterfaceCore", "CPUSummary", "ChainRulesCore", "CloseOpenIntervals", "DocStringExtensions", "ForwardDiff", "HostCPUFeatures", "IfElse", "LayoutPointers", "LinearAlgebra", "OffsetArrays", "PolyesterWeave", "SIMDTypes", "SLEEFPirates", "SnoopPrecompile", "SpecialFunctions", "Static", "StaticArrayInterface", "ThreadingUtilities", "UnPack", "VectorizationBase"]
git-tree-sha1 = "2c43795523f0e867aa07b72e62f5b194dcc76efe"
uuid = "bdcacae8-1622-11e9-2a5c-532679323890"
version = "0.12.154"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.MakieCore]]
deps = ["Observables"]
git-tree-sha1 = "9926529455a331ed73c19ff06d16906737a876ed"
uuid = "20f20a25-4f0e-4fdf-b5d1-57303727442b"
version = "0.6.3"

[[deps.ManualMemory]]
git-tree-sha1 = "bcaef4fc7a0cfe2cba636d84cda54b5e4e4ca3cd"
uuid = "d125e4d3-2237-4719-b19c-fa641b8a4667"
version = "0.1.8"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.MuladdMacro]]
git-tree-sha1 = "cac9cc5499c25554cba55cd3c30543cff5ca4fab"
uuid = "46d2c3a1-f734-5fdb-9937-b9b9aeba4221"
version = "0.2.4"

[[deps.NLSolversBase]]
deps = ["DiffResults", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "a0b464d183da839699f4c79e7606d9d186ec172c"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.8.3"

[[deps.NLsolve]]
deps = ["Distances", "LineSearches", "LinearAlgebra", "NLSolversBase", "Printf", "Reexport"]
git-tree-sha1 = "019f12e9a1a7880459d0173c182e6a99365d7ac1"
uuid = "2774e3e8-f4cf-5e23-947b-6d7e65073b56"
version = "4.5.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.NonlinearSolve]]
deps = ["ArrayInterface", "DiffEqBase", "EnumX", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "LinearSolve", "RecursiveArrayTools", "Reexport", "SciMLBase", "SimpleNonlinearSolve", "SnoopPrecompile", "SparseArrays", "SparseDiffTools", "StaticArraysCore", "UnPack"]
git-tree-sha1 = "f5790fba251930ff04479ea0bad9faea6af4d352"
uuid = "8913a72c-1f9b-4ce2-8d82-65094dcecaec"
version = "1.5.1"

[[deps.Observables]]
git-tree-sha1 = "6862738f9796b3edc1c09d0890afce4eca9e7e93"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.5.4"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "82d7c9e310fe55aa54996e6f7f94674e2a38fcb4"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.9"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9ff31d101d987eb9d66bd8b176ac7c277beccd09"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.20+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.OrdinaryDiffEq]]
deps = ["Adapt", "ArrayInterface", "DataStructures", "DiffEqBase", "DocStringExtensions", "ExponentialUtilities", "FastBroadcast", "FastClosures", "FiniteDiff", "ForwardDiff", "FunctionWrappersWrappers", "IfElse", "LinearAlgebra", "LinearSolve", "Logging", "LoopVectorization", "MacroTools", "MuladdMacro", "NLsolve", "NonlinearSolve", "Polyester", "PreallocationTools", "Preferences", "RecursiveArrayTools", "Reexport", "SciMLBase", "SciMLNLSolve", "SimpleNonlinearSolve", "SimpleUnPack", "SnoopPrecompile", "SparseArrays", "SparseDiffTools", "StaticArrayInterface", "StaticArrays", "TruncatedStacktraces"]
git-tree-sha1 = "9fb1f72106bfa1370006b90771cfbcce6c7468b6"
uuid = "1dea7af3-3e70-54e6-95c3-0bf5283fa5ed"
version = "6.49.4"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.40.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "67eae2738d63117a196f497d7db789821bce61d1"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.17"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "478ac6c952fddd4399e71d4779797c538d0ff2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.8"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "1f03a2d339f42dca4a4da149c7e15e9b896ad899"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.1.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "c95373e73290cf50a8a22c3375e4625ded5c5280"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.4"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Preferences", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SnoopPrecompile", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "f49a45a239e13333b8b936120fe6d793fe58a972"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.38.8"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "5bb5129fdd62a2bbbe17c2756932259acf467386"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.50"

[[deps.Polyester]]
deps = ["ArrayInterface", "BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "ManualMemory", "PolyesterWeave", "Requires", "Static", "StaticArrayInterface", "StrideArraysCore", "ThreadingUtilities"]
git-tree-sha1 = "0fe4e7c4d8ff4c70bfa507f0dd96fa161b115777"
uuid = "f517fe37-dbe3-4b94-8317-1923a5111588"
version = "0.7.3"

[[deps.PolyesterWeave]]
deps = ["BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "Static", "ThreadingUtilities"]
git-tree-sha1 = "240d7170f5ffdb285f9427b92333c3463bf65bf6"
uuid = "1d0040c9-8b98-4ee7-8388-3f51789ca0ad"
version = "0.2.1"

[[deps.Polynomials]]
deps = ["ChainRulesCore", "LinearAlgebra", "MakieCore", "RecipesBase"]
git-tree-sha1 = "86efc6f761df655f8782f50628e45e01a457d5a2"
uuid = "f27b6e38-b328-58d1-80ce-0feddd5e7a45"
version = "3.2.8"

[[deps.PreallocationTools]]
deps = ["Adapt", "ArrayInterface", "ForwardDiff", "Requires"]
git-tree-sha1 = "f739b1b3cc7b9949af3b35089931f2b58c289163"
uuid = "d236fae5-4411-538c-8e31-a6e3d9e00b46"
version = "0.4.12"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "6ec7ac8412e83d57e313393220879ede1740f9ee"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.8.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RandomExtensions]]
deps = ["Random", "SparseArrays"]
git-tree-sha1 = "062986376ce6d394b23d5d90f01d81426113a3c9"
uuid = "fb686558-2515-59ef-acaa-46db3789a887"
version = "0.4.3"

[[deps.RecipesBase]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "261dddd3b862bd2c940cf6ca4d1c8fe593e457c8"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.3"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase", "SnoopPrecompile"]
git-tree-sha1 = "e974477be88cb5e3040009f3767611bc6357846f"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.11"

[[deps.RecursiveArrayTools]]
deps = ["Adapt", "ArrayInterface", "ChainRulesCore", "DocStringExtensions", "FillArrays", "GPUArraysCore", "IteratorInterfaceExtensions", "LinearAlgebra", "RecipesBase", "Requires", "StaticArraysCore", "Statistics", "SymbolicIndexingInterface", "Tables", "ZygoteRules"]
git-tree-sha1 = "3dcb2a98436389c0aac964428a5fa099118944de"
uuid = "731186ca-8d62-57ce-b412-fbd966d074cd"
version = "2.38.0"

[[deps.RecursiveFactorization]]
deps = ["LinearAlgebra", "LoopVectorization", "Polyester", "SnoopPrecompile", "StrideArraysCore", "TriangularSolve"]
git-tree-sha1 = "9088515ad915c99026beb5436d0a09cd8c18163e"
uuid = "f2c3362d-daeb-58d1-803e-2bc74f2840b4"
version = "0.2.18"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "90bc7a7c96410424509e4263e277e43250c05691"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "f65dcb5fa46aee0cf9ed6274ccbd597adc49aa7b"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.1"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6ed52fdd3382cf21947b15e8870ac0ddbff736da"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.4.0+0"

[[deps.RuntimeGeneratedFunctions]]
deps = ["ExprTools", "SHA", "Serialization"]
git-tree-sha1 = "f139e81a81e6c29c40f1971c9e5309b09c03f2c3"
uuid = "7e49a35a-f44a-4d26-94aa-eba1b4ca6b47"
version = "0.5.6"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMDTypes]]
git-tree-sha1 = "330289636fb8107c5f32088d2741e9fd7a061a5c"
uuid = "94e857df-77ce-4151-89e5-788b33177be4"
version = "0.1.0"

[[deps.SLEEFPirates]]
deps = ["IfElse", "Static", "VectorizationBase"]
git-tree-sha1 = "cda0aece8080e992f6370491b08ef3909d1c04e7"
uuid = "476501e8-09a2-5ece-8869-fb82de89a1fa"
version = "0.6.38"

[[deps.SciMLBase]]
deps = ["ArrayInterface", "CommonSolve", "ConstructionBase", "Distributed", "DocStringExtensions", "EnumX", "FunctionWrappersWrappers", "IteratorInterfaceExtensions", "LinearAlgebra", "Logging", "Markdown", "Preferences", "RecipesBase", "RecursiveArrayTools", "Reexport", "RuntimeGeneratedFunctions", "SciMLOperators", "SnoopPrecompile", "StaticArraysCore", "Statistics", "SymbolicIndexingInterface", "Tables", "TruncatedStacktraces"]
git-tree-sha1 = "6bb55eff20ee05151b5cb4e777691fabae1524a3"
uuid = "0bca4576-84f4-4d90-8ffe-ffa030f20462"
version = "1.91.3"

[[deps.SciMLNLSolve]]
deps = ["DiffEqBase", "LineSearches", "NLsolve", "Reexport", "SciMLBase"]
git-tree-sha1 = "2e1606c282fae6bd9aed4f159695774a44b9c75f"
uuid = "e9a6253c-8580-4d32-9898-8661bb511710"
version = "0.1.4"

[[deps.SciMLOperators]]
deps = ["ArrayInterface", "DocStringExtensions", "Lazy", "LinearAlgebra", "Setfield", "SparseArrays", "StaticArraysCore", "Tricks"]
git-tree-sha1 = "e61e48ef909375203092a6e83508c8416df55a83"
uuid = "c0aeaf25-5076-4817-a8d5-81caf7dfa961"
version = "0.2.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "30449ee12237627992a99d5e30ae63e4d78cd24a"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleNonlinearSolve]]
deps = ["ArrayInterface", "DiffEqBase", "FiniteDiff", "ForwardDiff", "LinearAlgebra", "Reexport", "Requires", "SciMLBase", "SnoopPrecompile", "StaticArraysCore"]
git-tree-sha1 = "54c78ac3cc0343a16785adabe5bbf4063c737967"
uuid = "727e6d20-b764-4bd8-a329-72de5adea6c7"
version = "0.1.14"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.SimpleUnPack]]
git-tree-sha1 = "58e6353e72cde29b90a69527e56df1b5c3d8c437"
uuid = "ce78b400-467f-4804-87d8-8f486da07d0a"
version = "1.1.0"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SparseDiffTools]]
deps = ["Adapt", "ArrayInterface", "Compat", "DataStructures", "FiniteDiff", "ForwardDiff", "Graphs", "LinearAlgebra", "Requires", "SparseArrays", "StaticArrays", "VertexSafeGraphs"]
git-tree-sha1 = "e19ac47477c9a8fcca06dab5e5471417d5d9d723"
uuid = "47a9eef4-7e08-11e9-0b38-333d64bd3804"
version = "1.31.0"

[[deps.Sparspak]]
deps = ["Libdl", "LinearAlgebra", "Logging", "OffsetArrays", "Printf", "SparseArrays", "Test"]
git-tree-sha1 = "342cf4b449c299d8d1ceaf00b7a49f4fbc7940e7"
uuid = "e56a9233-b9d6-4f03-8d0f-1825330902ac"
version = "0.3.9"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "ef28127915f4229c971eb43f3fc075dd3fe91880"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.2.0"

[[deps.Static]]
deps = ["IfElse"]
git-tree-sha1 = "08be5ee09a7632c32695d954a602df96a877bf0d"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.8.6"

[[deps.StaticArrayInterface]]
deps = ["ArrayInterface", "Compat", "IfElse", "LinearAlgebra", "Requires", "SnoopPrecompile", "SparseArrays", "Static", "SuiteSparse"]
git-tree-sha1 = "fd5f417fd7e103c121b0a0b4a6902f03991111f4"
uuid = "0d7ed370-da01-4f52-bd93-41d350b8b718"
version = "1.3.0"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "b8d897fe7fa688e93aef573711cb207c08c9e11e"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.19"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "HypergeometricFunctions", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "f625d686d5a88bcd2b15cd81f18f98186fdc0c9a"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.3.0"

[[deps.StrideArraysCore]]
deps = ["ArrayInterface", "CloseOpenIntervals", "IfElse", "LayoutPointers", "ManualMemory", "SIMDTypes", "Static", "StaticArrayInterface", "ThreadingUtilities"]
git-tree-sha1 = "f859ab67ca232b777a03a6cee588c1c15f7ec40a"
uuid = "7792a7ef-975c-4747-a70f-980b88e8d1da"
version = "0.4.9"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+0"

[[deps.SymbolicIndexingInterface]]
deps = ["DocStringExtensions"]
git-tree-sha1 = "f8ab052bfcbdb9b48fad2c80c873aa0d0344dfe5"
uuid = "2efcf032-c050-4f8e-a9bb-153293bab1f5"
version = "0.2.2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "1544b926975372da01227b382066ab70e574a3ec"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.ThreadingUtilities]]
deps = ["ManualMemory"]
git-tree-sha1 = "c97f60dd4f2331e1a495527f80d242501d2f9865"
uuid = "8290d209-cae3-49c0-8002-c8c24d57dab5"
version = "0.5.1"

[[deps.TriangularSolve]]
deps = ["CloseOpenIntervals", "IfElse", "LayoutPointers", "LinearAlgebra", "LoopVectorization", "Polyester", "Static", "VectorizationBase"]
git-tree-sha1 = "31eedbc0b6d07c08a700e26d31298ac27ef330eb"
uuid = "d5829a12-d9aa-46ab-831f-fb7c9ab06edf"
version = "0.1.19"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.TruncatedStacktraces]]
deps = ["InteractiveUtils", "MacroTools", "Preferences"]
git-tree-sha1 = "7bc1632a4eafbe9bd94cf1a784a9a4eb5e040a91"
uuid = "781d530d-4396-4725-bb49-402e4bee1e77"
version = "1.3.0"

[[deps.URIs]]
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.VectorizationBase]]
deps = ["ArrayInterface", "CPUSummary", "HostCPUFeatures", "IfElse", "LayoutPointers", "Libdl", "LinearAlgebra", "SIMDTypes", "Static", "StaticArrayInterface"]
git-tree-sha1 = "a07b279148653974edd945c8c8e09af156bcb46e"
uuid = "3d5dd08c-fd9d-11e8-17fa-ed2836048c2f"
version = "0.21.62"

[[deps.VertexSafeGraphs]]
deps = ["Graphs"]
git-tree-sha1 = "8351f8d73d7e880bfc042a8b6922684ebeafb35c"
uuid = "19fa3120-7c27-5ec5-8db8-b0b0aa330d6f"
version = "0.2.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "ed8d92d9774b077c53e1da50fd81a36af3744c1c"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "93c41695bc1c08c46c5899f4fe06d6ead504bb73"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c6edfe154ad7b313c01aceca188c05c835c67360"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.4+0"

[[deps.ZygoteRules]]
deps = ["ChainRulesCore", "MacroTools"]
git-tree-sha1 = "977aed5d006b840e2e40c0b48984f7463109046d"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.3"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "868e669ccb12ba16eaf50cb2957ee2ff61261c56"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.29.0+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9ebfc140cc56e8c2156a15ceac2f0302e327ac0a"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+0"
"""

# ╔═╡ Cell order:
# ╟─b6be95c2-d187-433a-82a1-089410ef5580
# ╟─3feaf757-ff48-44a2-a215-575fe612674d
# ╟─74595914-a089-4984-961f-a9d19614675d
# ╟─493fcf66-26af-4fca-b613-2591750e5d30
# ╟─82387b99-2558-4dc7-b6a2-064a0f74b3f0
# ╟─f042b24f-b3cc-4f4f-9c5b-f5675250e663
# ╟─36aa8b1a-eb08-4b51-90a6-90d579b7bfad
# ╟─12244d34-2085-4b99-a19d-dcda64901d3c
# ╟─fcd228c9-eb32-4fd9-8fb9-f2df1d79a7dc
# ╟─629d548d-619c-4df3-985c-96fe273d907e
# ╟─6a31fe1a-d92d-4477-a622-bcd2855d0b0b
# ╟─8006b746-85bb-4c25-ba6e-812b62e35b4a
# ╟─d9dce1b0-b534-4740-ae36-20be872c8ca0
# ╟─20d889df-2165-48df-8a74-4a511c9206e2
# ╟─250bbc56-c12c-4994-a89a-04ed3f1964d2
# ╟─0672057b-e46b-46e9-a910-6847b94e5732
# ╟─19aa0519-e543-4899-9ccc-0c0469ace8be
# ╟─34b145ef-248a-4746-8082-ac0623440c32
# ╟─3cd870c7-1567-411c-84a9-6abd58d8fe20
# ╟─a77069c6-f158-431c-9e52-4c3f20572111
# ╟─53f67ce4-4aac-486c-a4f5-24a5b7b9a654
# ╟─833b9be3-4e7b-4e9c-925c-9b24eba44a18
# ╟─39f76355-2ea9-4038-a15d-b8e498441e9e
# ╟─360df6ad-6e55-4652-9046-ef9b55dd6f53
# ╟─334ca72b-f0f8-41a8-ae78-81abeddaaaf9
# ╟─348120b7-467c-4501-8504-42a1e889c917
# ╟─fb2b68d8-975b-4b38-8351-60b93db138f7
# ╟─608a7cf8-01ea-4296-8d35-cb00e820e0a7
# ╟─19a7a9e7-7c4a-441e-b0e5-ffd19f6cfd8e
# ╟─f9a30155-c524-4449-8d7e-9dda99d399db
# ╟─3e242dd6-2dd5-4931-b3fa-a897fd3c0878
# ╟─588a23a5-1d2c-4a32-b3d8-779f89793a5a
# ╟─13b2fc98-2173-4638-9ada-0aeef70d795d
# ╟─eed3568d-e647-485f-ab68-9619c408e961
# ╟─6f4f7f73-abea-4507-bdd6-16c37ad1e818
# ╟─3ee15f64-66fe-4570-8e14-40cd93f7d384
# ╟─641d76ce-0bc4-4561-bbd8-20c81cb5bca5
# ╟─a9fdfaa5-d9e3-43f0-8eb1-e0a20f4b0b0f
# ╟─58ee5733-e606-4a7c-9c70-4279529ff6f8
# ╟─8506a440-0e9c-4927-9258-8e33f8d43658
# ╟─2e47bf97-fd05-4973-8ccc-16c97f307b01
# ╟─1231cb19-33e8-4833-a510-3be047331618
# ╟─be92e2d6-a6e2-42a9-a306-610177dd3d04
# ╟─d331554d-36af-4b32-bec5-52325d1e1107
# ╟─1912670e-7afc-4c52-a5d2-4266ee6ad32f
# ╟─0804509e-a23d-411a-ac6a-6ba9c386fdfc
# ╟─f9a93182-3cc7-4d9c-9a77-1e7e6200e92c
# ╟─4d109fcc-1294-4015-b6d1-063164ee492b
# ╟─9dcd54bd-beda-479b-893c-74fbaeeb20bb
# ╟─257bada4-8250-4603-97f2-c07c307caf9b
# ╟─bee7cfd7-c50b-48fe-ae3b-857fd42a9716
# ╟─40966a45-c3f0-4769-85aa-65dcadd5c3e6
# ╟─2736d5f3-4285-4bef-beaf-c6d318fa9ab6
# ╟─5474d87c-3454-4192-8086-6acfd050f760
# ╟─3c6ce0fa-3050-452f-a3b1-a4d82a0966f1
# ╟─7e4d8e07-ddbf-454d-b9cd-f7f130477f84
# ╟─e333fd27-1499-4505-8276-12648fb0357c
# ╟─661a8f6d-b204-477b-bda0-3a1cc3db3cac
# ╟─12cbbf33-822a-40a4-abb3-248e0031d39c
# ╟─e6c2fa3f-ba9c-4da8-b82a-6245f23fe3c2
# ╟─fb8dd12d-553b-41e0-9299-309a85f7cc5e
# ╟─e4427075-3f3a-4771-b3a0-14c20f7accb2
# ╟─0f0779e8-4c07-455b-a761-fc41693c25c0
# ╟─3ca3df7f-472b-4485-b470-db206f6bfe36
# ╟─7503724c-113b-4e71-9af5-86ebf408c3b1
# ╟─85a9fe4b-d346-43e0-8045-290f9d6b7c8c
# ╟─1a0c33fa-5f04-4f33-915f-5e0c5ada42d7
# ╟─71a887d7-1605-4288-a1bb-067482feea4f
# ╟─d1b77dff-1605-426f-89fc-32bd4e29c185
# ╟─cfb24ec2-bd73-4c3a-833e-b1cc386adc41
# ╟─b1251b44-297c-497e-8586-1d2b59996454
# ╟─b7a0caf0-468b-4e33-89ec-601fbdd76529
# ╟─5bfe7a82-965c-4edc-8808-99e29d05605e
# ╟─61ed6eb1-df65-446d-9674-9a7a50b73138
# ╟─fcafa82b-cfeb-4257-92f1-455375b79532
# ╟─0b29d326-59a8-4d6c-b585-3915bd5c000f
# ╟─f6d8ab21-ea83-426d-8d8e-6f438d9c0130
# ╟─601fa98f-81df-4fb8-985b-2635431fd035
# ╟─a79b831d-6443-489b-ace3-2db1584084f8
# ╟─3bf84ea2-6ff6-47af-9c64-3dcbe786250a
# ╟─e1679284-5cee-46d0-806f-d749cb07c9bf
# ╟─9283bbb4-82c3-425d-acdf-d220f5f1a136
# ╟─e6348de0-fd5a-48cc-9bce-8b7a334eba52
# ╟─f1bef616-9b29-4c89-890a-22d890120fb4
# ╟─b6e88a4d-01a8-4f92-a7be-41f05bd84fc4
# ╟─0f9f299b-0e9c-4f87-92d4-a02e99a3a806
# ╟─72dbaaf0-3934-4fe4-9f75-eb49e872c18c
# ╟─4540ac70-b24c-4273-92c3-31dec4eceb91
# ╟─d7b5fee0-46c5-4e40-86e9-d77fc430d76d
# ╟─9fff376b-19a5-4e00-9360-165f6e295b9a
# ╟─d259c9c9-f7e8-44bd-906f-70c10a1f2b8a
# ╟─ce2009ae-10e8-4fc4-9d67-a1bfb34178f6
# ╟─b29f9455-d4db-448d-ae9f-21da09ec1a1d
# ╟─4aed9cab-6b08-46ee-90f0-2efacb7d8756
# ╟─a58574cf-fddd-485f-b22d-e38afece289a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
