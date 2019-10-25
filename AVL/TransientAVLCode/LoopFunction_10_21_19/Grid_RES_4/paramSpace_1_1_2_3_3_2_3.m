function [aeroForces] = paramSpace_1_1_2_3_3_2_3(sailStates,airStates)

	CL = (3.831204)*sailStates.alpha + (-0.245850)*sailStates.beta + (-2.697124)*sailStates.p + (37.255325)*sailStates.q + (-1.209491)*sailStates.r + (0.010552)*sailStates.de;
	CD = 0.059620;
	CY = (0.050515)*sailStates.alpha + (-0.027035)*sailStates.beta + (-0.335955)*sailStates.p + (0.684400)*sailStates.q + (-0.066850)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.397649)*sailStates.alpha + (0.056194)*sailStates.beta + (-1.398012)*sailStates.p + (12.433662)*sailStates.q + (-0.878821)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-13.318623)*sailStates.alpha + (0.905378)*sailStates.beta + (8.746150)*sailStates.p + (-140.146637)*sailStates.q + (4.054316)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.197199)*sailStates.alpha + (0.026115)*sailStates.beta + (0.495381)*sailStates.p + (-1.728117)*sailStates.q + (-0.020948)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end