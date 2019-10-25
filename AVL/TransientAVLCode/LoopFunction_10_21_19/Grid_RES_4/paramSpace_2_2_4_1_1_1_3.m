function [aeroForces] = paramSpace_2_2_4_1_1_1_3(sailStates,airStates)

	CL = (5.196440)*sailStates.alpha + (-0.170029)*sailStates.beta + (-3.526891)*sailStates.p + (44.677235)*sailStates.q + (-2.213911)*sailStates.r + (0.012098)*sailStates.de;
	CD = -1.784310;
	CY = (-0.510333)*sailStates.alpha + (-0.024607)*sailStates.beta + (-0.864860)*sailStates.p + (-1.471504)*sailStates.q + (-0.056841)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (1.299449)*sailStates.alpha + (0.442650)*sailStates.beta + (-1.976247)*sailStates.p + (17.366337)*sailStates.q + (-2.005082)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-11.516448)*sailStates.alpha + (0.641762)*sailStates.beta + (11.416652)*sailStates.p + (-162.286758)*sailStates.q + (7.484889)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.378127)*sailStates.alpha + (0.032549)*sailStates.beta + (1.888649)*sailStates.p + (-7.170237)*sailStates.q + (0.000890)*sailStates.r + (0.000198)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end