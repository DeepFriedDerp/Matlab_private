function [aeroForces] = paramSpace_1_1_1_2_1_2_1(sailStates,airStates)

	CL = (0.596781)*sailStates.alpha + (0.135661)*sailStates.beta + (-6.239367)*sailStates.p + (58.879978)*sailStates.q + (0.699804)*sailStates.r + (0.011137)*sailStates.de;
	CD = -3.358070;
	CY = (1.595657)*sailStates.alpha + (-0.029395)*sailStates.beta + (0.716794)*sailStates.p + (3.202498)*sailStates.q + (0.126086)*sailStates.r + (0.000730)*sailStates.de;

	Cl = (-1.788859)*sailStates.alpha + (-0.486345)*sailStates.beta + (-4.371221)*sailStates.p + (38.616810)*sailStates.q + (1.012063)*sailStates.r + (0.006001)*sailStates.de;
	Cm = (8.039587)*sailStates.alpha + (-0.550378)*sailStates.beta + (22.882149)*sailStates.p + (-245.344299)*sailStates.q + (-2.193163)*sailStates.r + (-0.083544)*sailStates.de;
	Cn = (-6.306982)*sailStates.alpha + (-0.093798)*sailStates.beta + (-2.490427)*sailStates.p + (12.372587)*sailStates.q + (-0.124449)*sailStates.r + (-0.000552)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end