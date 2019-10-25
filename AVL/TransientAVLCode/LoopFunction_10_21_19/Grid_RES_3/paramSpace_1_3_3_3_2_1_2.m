function [aeroForces] = paramSpace_1_3_3_3_2_1_2(sailStates,airStates)

	CL = (4.203351)*sailStates.alpha + (0.273487)*sailStates.beta + (-2.531279)*sailStates.p + (37.019730)*sailStates.q + (-1.522386)*sailStates.r + (0.011119)*sailStates.de;
	CD = -0.186980;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.481941)*sailStates.p + (-0.000001)*sailStates.q + (-0.084979)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.233285)*sailStates.alpha + (0.325842)*sailStates.beta + (-1.138945)*sailStates.p + (9.835544)*sailStates.q + (-1.174303)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-13.210204)*sailStates.alpha + (-0.951761)*sailStates.beta + (7.886761)*sailStates.p + (-134.612778)*sailStates.q + (5.062172)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.038396)*sailStates.alpha + (0.041842)*sailStates.beta + (0.940645)*sailStates.p + (-3.787923)*sailStates.q + (-0.005993)*sailStates.r + (-0.000093)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end