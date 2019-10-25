function [aeroForces] = paramSpace_1_1_2_1_2_1_1(sailStates,airStates)

	CL = (4.949892)*sailStates.alpha + (0.687907)*sailStates.beta + (-5.805107)*sailStates.p + (54.072498)*sailStates.q + (2.190247)*sailStates.r + (0.010873)*sailStates.de;
	CD = -6.768220;
	CY = (2.323617)*sailStates.alpha + (-0.032491)*sailStates.beta + (1.253195)*sailStates.p + (4.014464)*sailStates.q + (0.165271)*sailStates.r + (0.000908)*sailStates.de;

	Cl = (-0.949350)*sailStates.alpha + (-0.661963)*sailStates.beta + (-4.043591)*sailStates.p + (35.098438)*sailStates.q + (2.385877)*sailStates.r + (0.005335)*sailStates.de;
	Cm = (4.266747)*sailStates.alpha + (-2.874654)*sailStates.beta + (21.627171)*sailStates.p + (-231.623322)*sailStates.q + (-7.398981)*sailStates.r + (-0.081124)*sailStates.de;
	Cn = (-8.729911)*sailStates.alpha + (-0.113981)*sailStates.beta + (-3.458782)*sailStates.p + (14.894715)*sailStates.q + (-0.071864)*sailStates.r + (-0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end