function [aeroForces] = paramSpace_3_4_2_1_1_1_1(sailStates,airStates)

	CL = (5.068117)*sailStates.alpha + (0.413972)*sailStates.beta + (-1.587479)*sailStates.p + (24.961279)*sailStates.q + (-1.568428)*sailStates.r + (0.009973)*sailStates.de;
	CD = -1.740290;
	CY = (0.099197)*sailStates.alpha + (-0.023372)*sailStates.beta + (-0.744351)*sailStates.p + (-1.471499)*sailStates.q + (0.048839)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.370740)*sailStates.alpha + (0.533966)*sailStates.beta + (-0.398384)*sailStates.p + (1.728545)*sailStates.q + (-1.600217)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.484686)*sailStates.alpha + (-1.693530)*sailStates.beta + (6.037171)*sailStates.p + (-111.058342)*sailStates.q + (5.342806)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-1.453446)*sailStates.alpha + (-0.026703)*sailStates.beta + (1.728223)*sailStates.p + (-6.704082)*sailStates.q + (-0.006817)*sailStates.r + (0.000297)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end