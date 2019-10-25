function [aeroForces] = paramSpace_4_1_3_2_1_3_3(sailStates,airStates)

	CL = (4.698942)*sailStates.alpha + (0.500500)*sailStates.beta + (-2.903181)*sailStates.p + (42.067375)*sailStates.q + (2.355696)*sailStates.r + (0.011333)*sailStates.de;
	CD = -0.645090;
	CY = (0.001058)*sailStates.alpha + (-0.028261)*sailStates.beta + (0.863914)*sailStates.p + (-1.057312)*sailStates.q + (-0.171881)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.826032)*sailStates.alpha + (-0.226827)*sailStates.beta + (-1.529787)*sailStates.p + (14.479736)*sailStates.q + (1.928444)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-12.278605)*sailStates.alpha + (-1.869564)*sailStates.beta + (8.427607)*sailStates.p + (-143.598221)*sailStates.q + (-7.820330)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.477449)*sailStates.alpha + (0.080884)*sailStates.beta + (-1.664110)*sailStates.p + (7.144088)*sailStates.q + (0.007962)*sailStates.r + (0.000441)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end