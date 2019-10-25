function [aeroForces] = paramSpace_1_1_3_2_1_1_1(sailStates,airStates)

	CL = (3.937930)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.294156)*sailStates.p + (35.999420)*sailStates.q + (-1.559573)*sailStates.r + (0.010834)*sailStates.de;
	CD = -0.062640;
	CY = (-0.040076)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.418052)*sailStates.p + (-0.596613)*sailStates.q + (-0.104254)*sailStates.r + (-0.000125)*sailStates.de;

	Cl = (1.069212)*sailStates.alpha + (0.232476)*sailStates.beta + (-0.996410)*sailStates.p + (8.955131)*sailStates.q + (-1.164935)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-12.221874)*sailStates.alpha + (0.000000)*sailStates.beta + (6.921663)*sailStates.p + (-128.528122)*sailStates.q + (5.159904)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (-0.034109)*sailStates.alpha + (0.057963)*sailStates.beta + (0.782986)*sailStates.p + (-2.382791)*sailStates.q + (-0.033285)*sailStates.r + (0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end