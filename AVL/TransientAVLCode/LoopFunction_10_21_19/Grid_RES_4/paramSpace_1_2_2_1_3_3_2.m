function [aeroForces] = paramSpace_1_2_2_1_3_3_2(sailStates,airStates)

	CL = (5.044215)*sailStates.alpha + (0.082775)*sailStates.beta + (-2.260726)*sailStates.p + (27.648422)*sailStates.q + (0.835495)*sailStates.r + (0.009014)*sailStates.de;
	CD = -1.513140;
	CY = (0.183989)*sailStates.alpha + (-0.026804)*sailStates.beta + (0.538625)*sailStates.p + (1.664522)*sailStates.q + (0.107080)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (1.134591)*sailStates.alpha + (-0.316972)*sailStates.beta + (-1.094333)*sailStates.p + (8.098901)*sailStates.q + (1.046523)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-15.532876)*sailStates.alpha + (-0.332687)*sailStates.beta + (9.069288)*sailStates.p + (-132.472137)*sailStates.q + (-2.688829)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.305943)*sailStates.alpha + (-0.068600)*sailStates.beta + (-1.473959)*sailStates.p + (6.094177)*sailStates.q + (-0.041629)*sailStates.r + (-0.000339)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end