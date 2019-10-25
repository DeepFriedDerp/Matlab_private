function [aeroForces] = paramSpace_15_1_4_1_1_2_2(sailStates,airStates)

	CL = (5.155206)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.995065)*sailStates.p + (45.686737)*sailStates.q + (3.024838)*sailStates.r + (0.011609)*sailStates.de;
	CD = -1.043670;
	CY = (0.032512)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.106213)*sailStates.p + (-1.423509)*sailStates.q + (-0.275964)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (2.060497)*sailStates.alpha + (-0.497178)*sailStates.beta + (-1.548571)*sailStates.p + (15.449045)*sailStates.q + (2.477896)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-11.093497)*sailStates.alpha + (0.000000)*sailStates.beta + (7.865708)*sailStates.p + (-145.460434)*sailStates.q + (-9.936686)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.748647)*sailStates.alpha + (0.123960)*sailStates.beta + (-2.148901)*sailStates.p + (9.161358)*sailStates.q + (0.014136)*sailStates.r + (0.000575)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end