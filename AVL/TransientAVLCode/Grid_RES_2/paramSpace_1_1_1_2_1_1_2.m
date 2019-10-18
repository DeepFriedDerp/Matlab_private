function [aeroForces] = paramSpace_1_1_1_2_1_1_2(sailStates,airStates)

	CL = (5.148906)*sailStates.alpha + (-0.045746)*sailStates.beta + (-2.477094)*sailStates.p + (33.328815)*sailStates.q + (-1.037350)*sailStates.r + (0.009914)*sailStates.de;
	CD = -0.547720;
	CY = (1.003171)*sailStates.alpha + (-0.043604)*sailStates.beta + (-0.641441)*sailStates.p + (8.044625)*sailStates.q + (-0.085017)*sailStates.r + (0.001708)*sailStates.de;

	Cl = (1.842501)*sailStates.alpha + (-0.072961)*sailStates.beta + (-1.275657)*sailStates.p + (11.167593)*sailStates.q + (-0.586062)*sailStates.r + (0.000385)*sailStates.de;
	Cm = (-16.559452)*sailStates.alpha + (0.043575)*sailStates.beta + (8.110727)*sailStates.p + (-133.619614)*sailStates.q + (3.406403)*sailStates.r + (-0.067953)*sailStates.de;
	Cn = (-0.899735)*sailStates.alpha + (0.017972)*sailStates.beta + (1.038757)*sailStates.p + (-10.022569)*sailStates.q + (0.082487)*sailStates.r + (-0.002338)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end