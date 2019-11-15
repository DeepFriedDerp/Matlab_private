function [aeroForces] = paramSpace_1_3_4_1_2_3_2(sailStates,airStates)

	CL = (5.826020)*sailStates.alpha + (-0.116046)*sailStates.beta + (-2.311188)*sailStates.p + (27.277065)*sailStates.q + (1.278198)*sailStates.r + (0.009196)*sailStates.de;
	CD = -2.044230;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.832034)*sailStates.p + (0.000000)*sailStates.q + (0.165502)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.620259)*sailStates.alpha + (-0.443873)*sailStates.beta + (-1.094076)*sailStates.p + (7.610752)*sailStates.q + (1.449598)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-17.034538)*sailStates.alpha + (0.486561)*sailStates.beta + (9.658637)*sailStates.p + (-134.847153)*sailStates.q + (-4.162250)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.621012)*sailStates.alpha + (-0.078401)*sailStates.beta + (-2.069198)*sailStates.p + (9.824887)*sailStates.q + (-0.080352)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end