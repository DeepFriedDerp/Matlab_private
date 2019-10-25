function [aeroForces] = paramSpace_4_2_1_3_1_2_1(sailStates,airStates)

	CL = (3.966342)*sailStates.alpha + (0.059535)*sailStates.beta + (-2.215997)*sailStates.p + (33.153294)*sailStates.q + (0.998649)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.035550;
	CY = (-0.065459)*sailStates.alpha + (-0.025259)*sailStates.beta + (0.246956)*sailStates.p + (-0.294836)*sailStates.q + (-0.049091)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.141181)*sailStates.alpha + (-0.090776)*sailStates.beta + (-0.964593)*sailStates.p + (8.145752)*sailStates.q + (0.665843)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-13.924178)*sailStates.alpha + (-0.185092)*sailStates.beta + (7.208069)*sailStates.p + (-127.124184)*sailStates.q + (-3.314289)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.069192)*sailStates.alpha + (0.021926)*sailStates.beta + (-0.413335)*sailStates.p + (1.687513)*sailStates.q + (-0.012400)*sailStates.r + (0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end