function [aeroForces] = paramSpace_4_1_1_3_1_2_3(sailStates,airStates)

	CL = (3.902120)*sailStates.alpha + (0.204196)*sailStates.beta + (-2.698691)*sailStates.p + (37.158451)*sailStates.q + (1.191788)*sailStates.r + (0.010727)*sailStates.de;
	CD = 0.043030;
	CY = (-0.053730)*sailStates.alpha + (-0.026751)*sailStates.beta + (0.307144)*sailStates.p + (-0.684400)*sailStates.q + (-0.061021)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.396276)*sailStates.alpha + (-0.044106)*sailStates.beta + (-1.398783)*sailStates.p + (12.429267)*sailStates.q + (0.831630)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-13.710648)*sailStates.alpha + (-0.640859)*sailStates.beta + (8.766340)*sailStates.p + (-140.146637)*sailStates.q + (-3.952813)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.182971)*sailStates.alpha + (0.023110)*sailStates.beta + (-0.451994)*sailStates.p + (1.706018)*sailStates.q + (-0.020575)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end