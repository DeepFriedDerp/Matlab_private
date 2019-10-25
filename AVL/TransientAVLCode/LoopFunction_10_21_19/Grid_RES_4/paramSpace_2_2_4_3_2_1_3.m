function [aeroForces] = paramSpace_2_2_4_3_2_1_3(sailStates,airStates)

	CL = (4.262741)*sailStates.alpha + (-0.064709)*sailStates.beta + (-2.844330)*sailStates.p + (37.833313)*sailStates.q + (-1.006376)*sailStates.r + (0.011374)*sailStates.de;
	CD = -0.175460;
	CY = (-0.031874)*sailStates.alpha + (-0.024993)*sailStates.beta + (-0.371936)*sailStates.p + (0.065300)*sailStates.q + (-0.024371)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.438367)*sailStates.alpha + (0.161107)*sailStates.beta + (-1.442530)*sailStates.p + (12.166263)*sailStates.q + (-0.831834)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.380336)*sailStates.alpha + (0.220039)*sailStates.beta + (9.485637)*sailStates.p + (-144.341232)*sailStates.q + (3.376714)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.102079)*sailStates.alpha + (0.012176)*sailStates.beta + (0.767451)*sailStates.p + (-3.364626)*sailStates.q + (0.001710)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end