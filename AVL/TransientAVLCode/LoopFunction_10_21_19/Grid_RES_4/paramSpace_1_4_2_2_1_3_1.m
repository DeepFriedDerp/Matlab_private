function [aeroForces] = paramSpace_1_4_2_2_1_3_1(sailStates,airStates)

	CL = (4.191219)*sailStates.alpha + (-0.071513)*sailStates.beta + (-2.018665)*sailStates.p + (28.008009)*sailStates.q + (0.389488)*sailStates.r + (0.009548)*sailStates.de;
	CD = -0.425340;
	CY = (-0.189665)*sailStates.alpha + (-0.028261)*sailStates.beta + (0.409568)*sailStates.p + (-1.057313)*sailStates.q + (0.081506)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.067029)*sailStates.alpha + (-0.194028)*sailStates.beta + (-0.778331)*sailStates.p + (5.185302)*sailStates.q + (0.560748)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-15.128776)*sailStates.alpha + (0.267480)*sailStates.beta + (7.781376)*sailStates.p + (-124.043571)*sailStates.q + (-1.194128)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.710249)*sailStates.alpha + (-0.021885)*sailStates.beta + (-1.030256)*sailStates.p + (5.781624)*sailStates.q + (-0.062664)*sailStates.r + (0.000383)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end