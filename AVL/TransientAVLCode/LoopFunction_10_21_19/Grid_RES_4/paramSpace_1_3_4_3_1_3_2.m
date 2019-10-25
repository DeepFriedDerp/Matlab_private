function [aeroForces] = paramSpace_1_3_4_3_1_3_2(sailStates,airStates)

	CL = (4.059105)*sailStates.alpha + (0.001261)*sailStates.beta + (-2.445763)*sailStates.p + (32.799225)*sailStates.q + (-0.186913)*sailStates.r + (0.010308)*sailStates.de;
	CD = -0.131180;
	CY = (-0.058258)*sailStates.alpha + (-0.025446)*sailStates.beta + (0.180891)*sailStates.p + (-0.489618)*sailStates.q + (0.035929)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.223788)*sailStates.alpha + (-0.067273)*sailStates.beta + (-1.141050)*sailStates.p + (9.064503)*sailStates.q + (0.077267)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-15.028890)*sailStates.alpha + (0.034197)*sailStates.beta + (8.786243)*sailStates.p + (-135.545776)*sailStates.q + (0.661704)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.316513)*sailStates.alpha + (-0.011511)*sailStates.beta + (-0.574762)*sailStates.p + (3.502145)*sailStates.q + (-0.054056)*sailStates.r + (0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end