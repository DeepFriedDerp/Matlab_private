function [aeroForces] = paramSpace_1_1_3_1_2_3_1(sailStates,airStates)

	CL = (5.575469)*sailStates.alpha + (0.362642)*sailStates.beta + (-1.474596)*sailStates.p + (20.645090)*sailStates.q + (1.685702)*sailStates.r + (0.008945)*sailStates.de;
	CD = -2.144310;
	CY = (-0.420645)*sailStates.alpha + (-0.023492)*sailStates.beta + (0.952356)*sailStates.p + (-0.589408)*sailStates.q + (0.167870)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.117809)*sailStates.alpha + (-0.345824)*sailStates.beta + (-0.456375)*sailStates.p + (1.755048)*sailStates.q + (1.759106)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-16.271128)*sailStates.alpha + (-1.479535)*sailStates.beta + (6.781098)*sailStates.p + (-110.634644)*sailStates.q + (-5.561468)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (1.976785)*sailStates.alpha + (-0.088542)*sailStates.beta + (-2.185514)*sailStates.p + (10.230431)*sailStates.q + (-0.061223)*sailStates.r + (0.000315)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end