function [aeroForces] = paramSpace_3_4_3_2_2_2_3(sailStates,airStates)

	CL = (3.912593)*sailStates.alpha + (-0.087191)*sailStates.beta + (-2.949188)*sailStates.p + (37.969784)*sailStates.q + (0.388433)*sailStates.r + (0.011058)*sailStates.de;
	CD = 0.033750;
	CY = (0.003963)*sailStates.alpha + (-0.024668)*sailStates.beta + (0.098836)*sailStates.p + (-0.100923)*sailStates.q + (-0.006482)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.291581)*sailStates.alpha + (-0.071195)*sailStates.beta + (-1.478488)*sailStates.p + (12.157080)*sailStates.q + (0.278914)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.154804)*sailStates.alpha + (0.344011)*sailStates.beta + (10.030891)*sailStates.p + (-147.195892)*sailStates.q + (-1.325629)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.089820)*sailStates.alpha + (0.003338)*sailStates.beta + (-0.127201)*sailStates.p + (0.302666)*sailStates.q + (-0.003617)*sailStates.r + (0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end