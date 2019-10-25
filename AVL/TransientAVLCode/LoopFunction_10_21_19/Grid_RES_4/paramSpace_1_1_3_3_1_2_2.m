function [aeroForces] = paramSpace_1_1_3_3_1_2_2(sailStates,airStates)

	CL = (3.793414)*sailStates.alpha + (-0.176517)*sailStates.beta + (-2.476081)*sailStates.p + (34.908791)*sailStates.q + (-0.849310)*sailStates.r + (0.010520)*sailStates.de;
	CD = 0.070440;
	CY = (-0.061025)*sailStates.alpha + (-0.023279)*sailStates.beta + (-0.135008)*sailStates.p + (-0.489618)*sailStates.q + (-0.026872)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.220194)*sailStates.alpha + (0.029629)*sailStates.beta + (-1.210594)*sailStates.p + (10.398742)*sailStates.q + (-0.567005)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-13.604907)*sailStates.alpha + (0.611929)*sailStates.beta + (8.281826)*sailStates.p + (-134.519470)*sailStates.q + (2.859694)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.222502)*sailStates.alpha + (0.011637)*sailStates.beta + (0.121754)*sailStates.p + (0.562039)*sailStates.q + (-0.040676)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end