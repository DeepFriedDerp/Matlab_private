function [aeroForces] = paramSpace_3_3_2_1_1_2_3(sailStates,airStates)

	CL = (3.948932)*sailStates.alpha + (-0.045418)*sailStates.beta + (-3.434478)*sailStates.p + (42.221928)*sailStates.q + (0.886942)*sailStates.r + (0.011513)*sailStates.de;
	CD = -0.045090;
	CY = (-0.105110)*sailStates.alpha + (-0.024361)*sailStates.beta + (0.377699)*sailStates.p + (-1.915492)*sailStates.q + (-0.024688)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (1.553663)*sailStates.alpha + (-0.131454)*sailStates.beta + (-1.903887)*sailStates.p + (16.320282)*sailStates.q + (0.671446)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.927116)*sailStates.alpha + (0.149092)*sailStates.beta + (11.517565)*sailStates.p + (-160.694275)*sailStates.q + (-2.966366)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.212920)*sailStates.alpha + (0.006734)*sailStates.beta + (-0.680123)*sailStates.p + (4.101541)*sailStates.q + (0.008615)*sailStates.r + (0.000628)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end