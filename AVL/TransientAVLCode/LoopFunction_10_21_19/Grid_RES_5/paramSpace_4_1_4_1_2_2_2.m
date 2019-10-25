function [aeroForces] = paramSpace_4_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.329859)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.941943)*sailStates.p + (36.099277)*sailStates.q + (0.202723)*sailStates.r + (0.010570)*sailStates.de;
	CD = -0.490080;
	CY = (0.205929)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.264172)*sailStates.p + (1.241893)*sailStates.q + (0.037259)*sailStates.r + (0.000268)*sailStates.de;

	Cl = (1.351232)*sailStates.alpha + (-0.181908)*sailStates.beta + (-1.565197)*sailStates.p + (12.897985)*sailStates.q + (0.430802)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-14.917068)*sailStates.alpha + (0.000000)*sailStates.beta + (10.535559)*sailStates.p + (-149.211060)*sailStates.q + (-0.703689)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.119412)*sailStates.alpha + (-0.025566)*sailStates.beta + (-0.816268)*sailStates.p + (3.395224)*sailStates.q + (-0.023806)*sailStates.r + (-0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end