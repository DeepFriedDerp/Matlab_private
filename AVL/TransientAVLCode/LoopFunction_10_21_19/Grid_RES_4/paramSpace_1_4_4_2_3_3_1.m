function [aeroForces] = paramSpace_1_4_4_2_3_3_1(sailStates,airStates)

	CL = (4.009279)*sailStates.alpha + (-0.058048)*sailStates.beta + (-1.975195)*sailStates.p + (28.161366)*sailStates.q + (0.017782)*sailStates.r + (0.009714)*sailStates.de;
	CD = -0.270640;
	CY = (0.019387)*sailStates.alpha + (-0.023479)*sailStates.beta + (0.197702)*sailStates.p + (0.455226)*sailStates.q + (0.039374)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (0.837113)*sailStates.alpha + (-0.123319)*sailStates.beta + (-0.751166)*sailStates.p + (5.259661)*sailStates.q + (0.288801)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-14.791454)*sailStates.alpha + (0.351094)*sailStates.beta + (7.281127)*sailStates.p + (-121.885399)*sailStates.q + (-0.032656)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.322679)*sailStates.alpha + (-0.019485)*sailStates.beta + (-0.566046)*sailStates.p + (2.362535)*sailStates.q + (-0.025831)*sailStates.r + (-0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end