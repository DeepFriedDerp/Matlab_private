function [aeroForces] = paramSpace_1_3_2_2_2_2_2(sailStates,airStates)

	CL = (3.871787)*sailStates.alpha + (0.162367)*sailStates.beta + (-2.485790)*sailStates.p + (35.004059)*sailStates.q + (-0.874641)*sailStates.r + (0.010605)*sailStates.de;
	CD = 0.058650;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.196975)*sailStates.p + (-0.000000)*sailStates.q + (-0.034732)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.138033)*sailStates.alpha + (0.146755)*sailStates.beta + (-1.124418)*sailStates.p + (9.290796)*sailStates.q + (-0.592936)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-13.762736)*sailStates.alpha + (-0.585498)*sailStates.beta + (8.260130)*sailStates.p + (-134.612778)*sailStates.q + (2.944695)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.081523)*sailStates.alpha + (0.019198)*sailStates.beta + (0.279415)*sailStates.p + (-0.698507)*sailStates.q + (-0.020323)*sailStates.r + (-0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end