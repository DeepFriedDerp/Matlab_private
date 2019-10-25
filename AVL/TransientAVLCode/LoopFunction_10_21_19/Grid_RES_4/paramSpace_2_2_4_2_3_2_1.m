function [aeroForces] = paramSpace_2_2_4_2_3_2_1(sailStates,airStates)

	CL = (4.060879)*sailStates.alpha + (-0.019386)*sailStates.beta + (-2.157025)*sailStates.p + (31.728174)*sailStates.q + (-0.469535)*sailStates.r + (0.010898)*sailStates.de;
	CD = 0.013530;
	CY = (0.111112)*sailStates.alpha + (-0.025144)*sailStates.beta + (-0.161406)*sailStates.p + (0.668511)*sailStates.q + (-0.010509)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.088134)*sailStates.alpha + (0.043731)*sailStates.beta + (-0.891151)*sailStates.p + (6.951966)*sailStates.q + (-0.315394)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.648356)*sailStates.alpha + (0.039749)*sailStates.beta + (7.330187)*sailStates.p + (-125.787453)*sailStates.q + (1.554798)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.188819)*sailStates.alpha + (0.003662)*sailStates.beta + (0.311338)*sailStates.p + (-1.902281)*sailStates.q + (0.003182)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end