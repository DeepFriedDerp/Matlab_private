function [aeroForces] = paramSpace_1_2_2_2_2_1_1(sailStates,airStates)

	CL = (4.505329)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.180831)*sailStates.p + (35.156406)*sailStates.q + (-1.761082)*sailStates.r + (0.011200)*sailStates.de;
	CD = -0.485130;
	CY = (0.071152)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.626170)*sailStates.p + (-0.267955)*sailStates.q + (-0.110411)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.177802)*sailStates.alpha + (0.323774)*sailStates.beta + (-0.876019)*sailStates.p + (7.675110)*sailStates.q + (-1.438169)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-12.466232)*sailStates.alpha + (0.000000)*sailStates.beta + (6.448520)*sailStates.p + (-124.628265)*sailStates.q + (5.877374)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.496511)*sailStates.alpha + (0.057090)*sailStates.beta + (1.308877)*sailStates.p + (-5.339668)*sailStates.q + (0.004439)*sailStates.r + (-0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end