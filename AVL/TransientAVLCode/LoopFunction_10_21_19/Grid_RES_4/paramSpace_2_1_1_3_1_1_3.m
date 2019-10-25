function [aeroForces] = paramSpace_2_1_1_3_1_1_3(sailStates,airStates)

	CL = (4.091460)*sailStates.alpha + (-0.240268)*sailStates.beta + (-2.828996)*sailStates.p + (37.589443)*sailStates.q + (-0.901183)*sailStates.r + (0.011113)*sailStates.de;
	CD = -0.139160;
	CY = (-0.090762)*sailStates.alpha + (-0.024187)*sailStates.beta + (-0.335785)*sailStates.p + (-0.432842)*sailStates.q + (-0.021963)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.381676)*sailStates.alpha + (0.122761)*sailStates.beta + (-1.468586)*sailStates.p + (12.487677)*sailStates.q + (-0.798341)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-13.842886)*sailStates.alpha + (1.007495)*sailStates.beta + (9.465755)*sailStates.p + (-143.531296)*sailStates.q + (3.092815)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.193325)*sailStates.alpha + (0.011650)*sailStates.beta + (0.665582)*sailStates.p + (-2.252378)*sailStates.q + (-0.002764)*sailStates.r + (0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end