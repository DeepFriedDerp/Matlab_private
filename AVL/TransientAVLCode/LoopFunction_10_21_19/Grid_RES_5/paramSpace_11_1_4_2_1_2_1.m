function [aeroForces] = paramSpace_11_1_4_2_1_2_1(sailStates,airStates)

	CL = (4.259023)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.354761)*sailStates.p + (34.427628)*sailStates.q + (1.144822)*sailStates.r + (0.011013)*sailStates.de;
	CD = -0.156840;
	CY = (-0.081634)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.447535)*sailStates.p + (-0.322048)*sailStates.q + (-0.047072)*sailStates.r + (-0.000069)*sailStates.de;

	Cl = (1.268725)*sailStates.alpha + (-0.210796)*sailStates.beta + (-1.029270)*sailStates.p + (8.479958)*sailStates.q + (0.953821)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-13.999328)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.671699)*sailStates.p + (-130.700150)*sailStates.q + (-3.890412)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (0.253468)*sailStates.alpha + (0.022156)*sailStates.beta + (-0.891036)*sailStates.p + (3.862572)*sailStates.q + (0.004528)*sailStates.r + (0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end