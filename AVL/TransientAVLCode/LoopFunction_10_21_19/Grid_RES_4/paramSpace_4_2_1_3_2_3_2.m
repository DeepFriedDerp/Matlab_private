function [aeroForces] = paramSpace_4_2_1_3_2_3_2(sailStates,airStates)

	CL = (4.228580)*sailStates.alpha + (0.109471)*sailStates.beta + (-2.531180)*sailStates.p + (37.538445)*sailStates.q + (1.634750)*sailStates.r + (0.011228)*sailStates.de;
	CD = -0.184520;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.503041)*sailStates.p + (0.000000)*sailStates.q + (-0.100061)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.322402)*sailStates.alpha + (-0.215720)*sailStates.beta + (-1.195184)*sailStates.p + (10.716934)*sailStates.q + (1.258471)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-13.099638)*sailStates.alpha + (-0.377143)*sailStates.beta + (7.753676)*sailStates.p + (-134.847153)*sailStates.q + (-5.414635)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.031783)*sailStates.alpha + (0.049890)*sailStates.beta + (-0.962202)*sailStates.p + (3.716289)*sailStates.q + (-0.011908)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end