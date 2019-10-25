function [aeroForces] = paramSpace_1_2_1_2_3_2_2(sailStates,airStates)

	CL = (3.974733)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.481861)*sailStates.p + (35.411636)*sailStates.q + (-1.087184)*sailStates.r + (0.010641)*sailStates.de;
	CD = 0.048570;
	CY = (0.098150)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.338918)*sailStates.p + (0.759372)*sailStates.q + (-0.059833)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.307605)*sailStates.alpha + (0.139174)*sailStates.beta + (-1.161801)*sailStates.p + (9.925961)*sailStates.q + (-0.796077)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-13.768083)*sailStates.alpha + (0.000000)*sailStates.beta + (8.073390)*sailStates.p + (-134.568695)*sailStates.q + (3.665979)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.023178)*sailStates.alpha + (0.024540)*sailStates.beta + (0.556996)*sailStates.p + (-2.346532)*sailStates.q + (-0.006140)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end