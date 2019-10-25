function [aeroForces] = paramSpace_4_2_1_1_2_1_2(sailStates,airStates)

	CL = (5.826020)*sailStates.alpha + (-0.116046)*sailStates.beta + (-2.311188)*sailStates.p + (27.277065)*sailStates.q + (-1.278198)*sailStates.r + (0.009196)*sailStates.de;
	CD = -2.044230;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.832034)*sailStates.p + (-0.000000)*sailStates.q + (0.165502)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.676279)*sailStates.alpha + (0.387750)*sailStates.beta + (-1.125624)*sailStates.p + (8.007721)*sailStates.q + (-1.443365)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-17.034538)*sailStates.alpha + (0.486561)*sailStates.beta + (9.658637)*sailStates.p + (-134.847153)*sailStates.q + (4.162251)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.594426)*sailStates.alpha + (-0.087019)*sailStates.beta + (2.075473)*sailStates.p + (-9.903850)*sailStates.q + (-0.081591)*sailStates.r + (-0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end