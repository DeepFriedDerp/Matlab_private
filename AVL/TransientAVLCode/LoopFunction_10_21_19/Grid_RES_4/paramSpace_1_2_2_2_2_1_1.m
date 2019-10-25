function [aeroForces] = paramSpace_1_2_2_2_2_1_1(sailStates,airStates)

	CL = (4.460052)*sailStates.alpha + (-0.144424)*sailStates.beta + (-2.169603)*sailStates.p + (35.605911)*sailStates.q + (-1.857263)*sailStates.r + (0.011118)*sailStates.de;
	CD = -0.483750;
	CY = (0.071229)*sailStates.alpha + (-0.024646)*sailStates.beta + (-0.649714)*sailStates.p + (-0.301045)*sailStates.q + (-0.129225)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.196271)*sailStates.alpha + (0.297592)*sailStates.beta + (-0.885091)*sailStates.p + (7.994712)*sailStates.q + (-1.512929)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-11.945086)*sailStates.alpha + (0.548715)*sailStates.beta + (6.247097)*sailStates.p + (-123.990753)*sailStates.q + (6.180362)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.476477)*sailStates.alpha + (0.067583)*sailStates.beta + (1.345985)*sailStates.p + (-5.349602)*sailStates.q + (0.001754)*sailStates.r + (-0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end