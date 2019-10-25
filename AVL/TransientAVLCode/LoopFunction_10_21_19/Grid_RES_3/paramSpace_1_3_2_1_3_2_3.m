function [aeroForces] = paramSpace_1_3_2_1_3_2_3(sailStates,airStates)

	CL = (3.903602)*sailStates.alpha + (0.252905)*sailStates.beta + (-3.301500)*sailStates.p + (42.491058)*sailStates.q + (-1.610485)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.034360;
	CY = (0.090351)*sailStates.alpha + (-0.019135)*sailStates.beta + (-0.557698)*sailStates.p + (2.260755)*sailStates.q + (-0.098337)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.592026)*sailStates.alpha + (0.286939)*sailStates.beta + (-1.801937)*sailStates.p + (16.098177)*sailStates.q + (-1.195723)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-13.243342)*sailStates.alpha + (-0.887987)*sailStates.beta + (10.549961)*sailStates.p + (-156.476898)*sailStates.q + (5.363164)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (0.476789)*sailStates.alpha + (0.030103)*sailStates.beta + (0.909596)*sailStates.p + (-4.644406)*sailStates.q + (0.005572)*sailStates.r + (-0.000731)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end