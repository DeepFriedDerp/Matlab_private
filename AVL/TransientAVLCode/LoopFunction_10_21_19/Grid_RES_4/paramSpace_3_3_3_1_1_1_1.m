function [aeroForces] = paramSpace_3_3_3_1_1_1_1(sailStates,airStates)

	CL = (5.089978)*sailStates.alpha + (0.131190)*sailStates.beta + (-1.606860)*sailStates.p + (25.243664)*sailStates.q + (-1.558686)*sailStates.r + (0.010103)*sailStates.de;
	CD = -1.708510;
	CY = (0.092181)*sailStates.alpha + (-0.024400)*sailStates.beta + (-0.729113)*sailStates.p + (-1.471503)*sailStates.q + (0.047737)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.458270)*sailStates.alpha + (0.459045)*sailStates.beta + (-0.440011)*sailStates.p + (2.206137)*sailStates.q + (-1.573294)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.655623)*sailStates.alpha + (-0.520427)*sailStates.beta + (6.101104)*sailStates.p + (-112.102478)*sailStates.q + (5.292833)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-1.405146)*sailStates.alpha + (-0.027421)*sailStates.beta + (1.707925)*sailStates.p + (-6.716930)*sailStates.q + (-0.006854)*sailStates.r + (0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end