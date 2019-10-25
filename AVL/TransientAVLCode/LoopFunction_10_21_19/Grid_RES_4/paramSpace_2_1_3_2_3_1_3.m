function [aeroForces] = paramSpace_2_1_3_2_3_1_3(sailStates,airStates)

	CL = (4.718800)*sailStates.alpha + (-0.328646)*sailStates.beta + (-2.968058)*sailStates.p + (39.203369)*sailStates.q + (-1.589226)*sailStates.r + (0.011330)*sailStates.de;
	CD = -0.609980;
	CY = (-0.002546)*sailStates.alpha + (-0.025623)*sailStates.beta + (-0.685117)*sailStates.p + (0.870360)*sailStates.q + (-0.044874)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.789778)*sailStates.alpha + (0.199443)*sailStates.beta + (-1.579828)*sailStates.p + (13.697182)*sailStates.q + (-1.369538)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.167434)*sailStates.alpha + (1.224852)*sailStates.beta + (9.721912)*sailStates.p + (-146.834122)*sailStates.q + (5.362992)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.239667)*sailStates.alpha + (0.022031)*sailStates.beta + (1.424863)*sailStates.p + (-6.804432)*sailStates.q + (0.010350)*sailStates.r + (-0.000385)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end