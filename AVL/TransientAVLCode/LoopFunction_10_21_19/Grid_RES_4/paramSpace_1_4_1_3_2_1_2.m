function [aeroForces] = paramSpace_1_4_1_3_2_1_2(sailStates,airStates)

	CL = (4.074191)*sailStates.alpha + (0.388510)*sailStates.beta + (-2.510135)*sailStates.p + (37.415207)*sailStates.q + (-1.652852)*sailStates.r + (0.010802)*sailStates.de;
	CD = -0.173510;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.544581)*sailStates.p + (-0.000000)*sailStates.q + (-0.108324)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.214933)*sailStates.alpha + (0.375219)*sailStates.beta + (-1.122332)*sailStates.p + (9.855762)*sailStates.q + (-1.310960)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.297580)*sailStates.alpha + (-1.519357)*sailStates.beta + (7.662428)*sailStates.p + (-133.820877)*sailStates.q + (5.535509)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.031064)*sailStates.alpha + (0.053469)*sailStates.beta + (1.037535)*sailStates.p + (-3.902167)*sailStates.q + (-0.010280)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end