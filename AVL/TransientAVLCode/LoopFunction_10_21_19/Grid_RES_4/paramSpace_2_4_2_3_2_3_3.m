function [aeroForces] = paramSpace_2_4_2_3_2_3_3(sailStates,airStates)

	CL = (4.108993)*sailStates.alpha + (-0.067575)*sailStates.beta + (-2.790202)*sailStates.p + (36.038666)*sailStates.q + (0.282834)*sailStates.r + (0.010829)*sailStates.de;
	CD = -0.138980;
	CY = (0.031234)*sailStates.alpha + (-0.024710)*sailStates.beta + (0.215272)*sailStates.p + (0.065300)*sailStates.q + (0.014107)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.293908)*sailStates.alpha + (-0.127514)*sailStates.beta + (-1.357131)*sailStates.p + (10.874735)*sailStates.q + (0.346872)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.586048)*sailStates.alpha + (0.261739)*sailStates.beta + (9.701964)*sailStates.p + (-143.297119)*sailStates.q + (-0.949207)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.067750)*sailStates.alpha + (-0.005763)*sailStates.beta + (-0.569366)*sailStates.p + (2.852321)*sailStates.q + (-0.008770)*sailStates.r + (0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end