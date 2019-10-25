function [aeroForces] = paramSpace_10_1_4_1_1_2_1(sailStates,airStates)

	CL = (5.208958)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.082466)*sailStates.p + (32.591793)*sailStates.q + (1.833308)*sailStates.r + (0.011097)*sailStates.de;
	CD = -0.996710;
	CY = (-0.288917)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.844076)*sailStates.p + (-0.839976)*sailStates.q + (-0.059112)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (1.518234)*sailStates.alpha + (-0.388101)*sailStates.beta + (-0.796353)*sailStates.p + (6.380615)*sailStates.q + (1.628475)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.117147)*sailStates.alpha + (0.000000)*sailStates.beta + (6.625223)*sailStates.p + (-122.784714)*sailStates.q + (-6.228627)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (1.059801)*sailStates.alpha + (0.027139)*sailStates.beta + (-1.809322)*sailStates.p + (8.598118)*sailStates.q + (0.016348)*sailStates.r + (0.000362)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end