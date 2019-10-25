function [aeroForces] = paramSpace_1_3_3_3_1_2_1(sailStates,airStates)

	CL = (3.843323)*sailStates.alpha + (0.054872)*sailStates.beta + (-2.244243)*sailStates.p + (33.040352)*sailStates.q + (-0.756112)*sailStates.r + (0.010561)*sailStates.de;
	CD = 0.065090;
	CY = (-0.073677)*sailStates.alpha + (-0.025680)*sailStates.beta + (-0.105721)*sailStates.p + (-0.684401)*sailStates.q + (-0.021054)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.017283)*sailStates.alpha + (0.095104)*sailStates.beta + (-0.950697)*sailStates.p + (7.699998)*sailStates.q + (-0.477115)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-13.799639)*sailStates.alpha + (-0.190756)*sailStates.beta + (7.534264)*sailStates.p + (-128.521423)*sailStates.q + (2.550650)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.133584)*sailStates.alpha + (0.017468)*sailStates.beta + (0.112937)*sailStates.p + (0.450328)*sailStates.q + (-0.034822)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end