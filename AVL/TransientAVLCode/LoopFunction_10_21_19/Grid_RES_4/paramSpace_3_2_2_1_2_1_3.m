function [aeroForces] = paramSpace_3_2_2_1_2_1_3(sailStates,airStates)

	CL = (5.897342)*sailStates.alpha + (-0.148175)*sailStates.beta + (-3.393543)*sailStates.p + (39.469204)*sailStates.q + (-1.777450)*sailStates.r + (0.010975)*sailStates.de;
	CD = -2.194080;
	CY = (-0.373750)*sailStates.alpha + (-0.025048)*sailStates.beta + (-0.946089)*sailStates.p + (-0.221995)*sailStates.q + (0.062018)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.957710)*sailStates.alpha + (0.443721)*sailStates.beta + (-1.928805)*sailStates.p + (15.992495)*sailStates.q + (-1.766815)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-14.359351)*sailStates.alpha + (0.600119)*sailStates.beta + (12.205651)*sailStates.p + (-161.490479)*sailStates.q + (6.042350)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (1.034282)*sailStates.alpha + (-0.032855)*sailStates.beta + (2.241923)*sailStates.p + (-10.439259)*sailStates.q + (-0.022931)*sailStates.r + (-0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end