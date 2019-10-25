function [aeroForces] = paramSpace_1_1_1_1_2_3_3(sailStates,airStates)

	CL = (5.345842)*sailStates.alpha + (0.240070)*sailStates.beta + (-3.192587)*sailStates.p + (35.244202)*sailStates.q + (1.051709)*sailStates.r + (0.009534)*sailStates.de;
	CD = -1.902530;
	CY = (0.337260)*sailStates.alpha + (-0.026462)*sailStates.beta + (0.725604)*sailStates.p + (0.589409)*sailStates.q + (0.127888)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.831703)*sailStates.alpha + (-0.332998)*sailStates.beta + (-1.865424)*sailStates.p + (15.220059)*sailStates.q + (1.195777)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-14.589716)*sailStates.alpha + (-0.912367)*sailStates.beta + (12.356555)*sailStates.p + (-158.590912)*sailStates.q + (-3.393114)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.689698)*sailStates.alpha + (-0.079365)*sailStates.beta + (-1.985266)*sailStates.p + (9.890468)*sailStates.q + (-0.081260)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end