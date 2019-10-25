function [aeroForces] = paramSpace_2_2_2_2_1_1_1(sailStates,airStates)

	CL = (5.161849)*sailStates.alpha + (-3.972358)*sailStates.beta + (-3.429890)*sailStates.p + (47.249374)*sailStates.q + (2.250182)*sailStates.r + (0.010353)*sailStates.de;
	CD = -5.864180;
	CY = (1.752318)*sailStates.alpha + (-0.265708)*sailStates.beta + (0.365669)*sailStates.p + (15.067960)*sailStates.q + (-0.037469)*sailStates.r + (0.002867)*sailStates.de;

	Cl = (-5.374033)*sailStates.alpha + (-1.258921)*sailStates.beta + (-1.660175)*sailStates.p + (14.125579)*sailStates.q + (2.493558)*sailStates.r + (0.001199)*sailStates.de;
	Cm = (5.681151)*sailStates.alpha + (18.158218)*sailStates.beta + (10.629562)*sailStates.p + (-150.807877)*sailStates.q + (-8.004703)*sailStates.r + (-0.055215)*sailStates.de;
	Cn = (-1.822203)*sailStates.alpha + (0.378896)*sailStates.beta + (-1.002741)*sailStates.p + (-8.120494)*sailStates.q + (-0.196373)*sailStates.r + (-0.003772)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end