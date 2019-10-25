function [aeroForces] = paramSpace_4_4_3_2_1_3_3(sailStates,airStates)

	CL = (4.698942)*sailStates.alpha + (-0.500500)*sailStates.beta + (-2.903181)*sailStates.p + (42.067375)*sailStates.q + (2.355695)*sailStates.r + (0.011333)*sailStates.de;
	CD = -0.645090;
	CY = (0.001058)*sailStates.alpha + (-0.021311)*sailStates.beta + (0.863914)*sailStates.p + (-1.057312)*sailStates.q + (-0.171881)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.716237)*sailStates.alpha + (-0.542511)*sailStates.beta + (-1.435413)*sailStates.p + (13.291852)*sailStates.q + (1.909629)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-12.278604)*sailStates.alpha + (1.869563)*sailStates.beta + (8.427607)*sailStates.p + (-143.598221)*sailStates.q + (-7.820332)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.349783)*sailStates.alpha + (0.072147)*sailStates.beta + (-1.682882)*sailStates.p + (7.380373)*sailStates.q + (0.011705)*sailStates.r + (0.000441)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end