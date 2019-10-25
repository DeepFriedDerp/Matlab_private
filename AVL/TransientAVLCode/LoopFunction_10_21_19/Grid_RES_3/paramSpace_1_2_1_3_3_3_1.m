function [aeroForces] = paramSpace_1_2_1_3_3_3_1(sailStates,airStates)

	CL = (3.902280)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.191496)*sailStates.p + (31.168657)*sailStates.q + (-0.268483)*sailStates.r + (0.010112)*sailStates.de;
	CD = -0.028980;
	CY = (0.034856)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.035842)*sailStates.p + (0.318252)*sailStates.q + (0.006290)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.071174)*sailStates.alpha + (-0.030614)*sailStates.beta + (-0.944749)*sailStates.p + (7.386586)*sailStates.q + (-0.053050)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-14.370993)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.717048)*sailStates.p + (-127.854218)*sailStates.q + (0.956078)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (0.169455)*sailStates.alpha + (-0.005398)*sailStates.beta + (-0.243806)*sailStates.p + (1.410651)*sailStates.q + (-0.023110)*sailStates.r + (-0.000054)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end